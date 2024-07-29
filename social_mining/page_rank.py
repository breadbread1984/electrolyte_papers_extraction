#!/usr/bin/python3

from absl import flags, app
import pickle
from os.path import exists
from neo4j import GraphDatabase
from scipy import sparse
import numpy as np

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('host', default = 'bolt://localhost:7687', help = 'host address')
  flags.DEFINE_string('user', default = 'neo4j', help = 'user name')
  flags.DEFINE_string('password', default = 'neo4j', help = 'password')
  flags.DEFINE_string('db', default = 'neo4j', help = 'database')

def main(unused_argv):
  if not exists('weights.npz'):
    driver = GraphDatabase.driver(FLAGS.host, auth = (FLAGS.user, FLAGS.password))
    records, summary, keys = driver.execute_query('match (a: Author) return a as author', database_ = FLAGS.db)
    matches = [record['author'] for record in records]
    authors = dict()
    for match in matches:
      authors[match.element_id] = match._properties['name']
    data,row,col = list(),list(),list()
    for idx1, (id1, name1) in enumerate(authors.items()):
      for idx2, (id2, name2) in enumerate(authors.items()):
        if id1 == id2: continue
        records, summary, keys = driver.execute_query('match (a: Author)-[:CONTRIBUTES_TO]->(c: Paper)<-[:CONTRIBUTES_TO]-(b: Author) where elementid(a) = $id1 and elementid(b) = $id2 return c as paper', id1 = id1, id2 = id2, database_ = FLAGS.db)
        papers = [record['paper'] for record in records]
        weight = np.sum([paper._properties['cited'] for paper in papers])
        if weight == 0: continue
        data.append(weight)
        row.append(idx1)
        col.append(idx2)
    weights = sparse.coo_matrix((data, (row, col)), shape = (len(authors),len(authors)))
    sparse.save_npz('weights.npz', weights)
    with open('authors.pkl', 'wb') as f:
      f.write(pickle.dumps(list(authors.keys())))
  else:
    weights = sparse.load_npz('weights.npz') # wights.shape = (row, col)
    with open('authors.pkl', 'rb') as f:
      authors = pickle.loads(f.read())
  # 1) calculate author weight
  A = weights.copy()
  diags = A.sum(axis = -1)
  diags = np.maximum(np.squeeze(np.array(diags.data)), 1e-10).tolist()
  D = sparse.diags(diags) # D.shape(row, col)
  invD = sparse.linalg.inv(D)
  T = A.transpose().dot(invD)
  C = sparse.coo_matrix(
    (
      np.ones((len(authors),)) * 1 / len(authors),
      (
        np.arange(len(authors)),
        np.zeros((len(authors),))
      )
    ),
    shape = (len(authors),1)
  )
  delta = sparse.coo_matrix(
    (
      np.ones((len(authors),)) * 1e-10,
      (
        np.arange(len(authors)),
        np.zeros((len(authors),))
      )
    ),
    shape = (len(authors),1)
  )
  for i in range(100):
    C = T.dot(C) + delta
  C = C.toarray()
  author_weights = dict()
  for id, weight in zip(authors, C):
    author_weights[id] = weight
  with open('author_weights.pkl', 'wb') as f:
    f.write(pickle.dumps(author_weights))
  # 2) calculate connect components
  def dfs(node, adj_matrix, visited, component):
      """Performs DFS to find all nodes in the same connected component."""
      stack = [node]
      while stack:
          current = stack.pop()
          if not visited[current]:
              visited[current] = True
              component.append(current)
              for neighbor, is_connected in enumerate(np.squeeze(adj_matrix.getrow(current).toarray(), axis = 0)):
                  if is_connected and not visited[neighbor]:
                      stack.append(neighbor)

  def find_connected_components(adj_matrix):
      """Finds all connected components in an undirected graph represented by an adjacency matrix."""
      num_nodes = adj_matrix.shape[0]
      visited = [False] * num_nodes
      components = []

      for node in range(num_nodes):
          if not visited[node]:
              component = []
              dfs(node, adj_matrix, visited, component)
              components.append(component)

      return components

  adj = weights.tocsr()
  components = find_connected_components(adj)
  components_new = list()
  for component in components:
    component_new = [authors[node] for node in component]
    components_new.append(component_new)
  with open('connected_components.pkl', 'wb') as f:
    f.write(pickle.dumps(components_new))

if __name__ == "__main__":
  add_options()
  app.run(main)

