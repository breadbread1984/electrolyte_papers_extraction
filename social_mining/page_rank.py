#!/usr/bin/python3

from absl import flags, app
import pickle
from os.path import exists
from neo4j import GraphDatabase
from scipy import sparse
import pandas as pd
import numpy as np

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('host', default = 'bolt://localhost:7687', help = 'host address')
  flags.DEFINE_string('user', default = 'neo4j', help = 'user name')
  flags.DEFINE_string('password', default = 'neo4j', help = 'password')
  flags.DEFINE_string('db', default = 'neo4j', help = 'database')

def main(unused_argv):
  if not exists('total_citation.npz'):
    driver = GraphDatabase.driver(FLAGS.host, auth = (FLAGS.user, FLAGS.password))
    records, summary, keys = driver.execute_query('match (a: Author) return a as author', database_ = FLAGS.db)
    total_citation = pd.DataFrame(
      {record['author'].element_id: np.zeros(len(records)) for record in records},
      index = [record['author'].element_id for record in records]
    )
    for from_author_id in total_citation.index:
      for to_author_id in total_citation.columns:
        if frome_author_id == to_author_id: continue
        records, summary, keys = driver.execute_query('match (a: Author)-[:CONTRIBUTES_TO]->(c: Paper)<-[:CONTRIBUTES_TO]-(b: Author) where elementid(a) = $id1 and elementid(b) = $id2 return c as paper', id1 = from_author_id, id2 = to_author_id, database_ = FLAGS.db)
        papers = [record['paper'] for record in records]
        weight = np.sum([paper._properties['cited'] for paper in papers])
        if weight == 0: continue
        total_citation.loc[from_author_id, to_author_id] = weight
    df.to_pickle('total_citation.npz')
  else:
    total_citation = pd.read_pickle('total_citation.npz')
  weights = sparse.csr_matrix(total_citation.values)
  # 1) calculate author weight
  A = weights.copy()
  diags = A.sum(axis = -1)
  diags = np.maximum(np.squeeze(np.array(diags.data)), 1e-10).tolist()
  D = sparse.diags(diags) # D.shape(row, col)
  invD = sparse.linalg.inv(D)
  T = A.dot(invD)
  C = sparse.coo_matrix(
    (
      np.ones((len(total_citation.index),)) * 1 / len(total_citation.index),
      (
        np.arange(len(total_citation.index)),
        np.zeros((len(total_citation.index),))
      )
    ),
    shape = (len(total_citation.index),1)
  )
  delta = sparse.coo_matrix(
    (
      np.ones((len(total_citation.index),)) * 1e-10,
      (
        np.arange(len(total_citation.index)),
        np.zeros((len(total_citation.index),))
      )
    ),
    shape = (len(total_citation.index),1)
  )
  for i in range(100):
    C = T.dot(C) + delta
  C = C.toarray()
  author_weights = dict()
  for id, weight in zip(total_citation.index, C):
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
              for neighbor, is_connected in enumerate(adj_matrix.iloc[current]):
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

  adj = total_citation
  components = find_connected_components(adj)
  components_new = list()
  for component in components:
    component_new = [total_citation.index[node] for node in component]
    components_new.append(component_new)
  with open('connected_components.pkl', 'wb') as f:
    f.write(pickle.dumps(components_new))

if __name__ == "__main__":
  add_options()
  app.run(main)

