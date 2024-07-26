#!/usr/bin/python3

from absl import flags, app
from neo4j import GraphDatabase
import numpy as np

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('host', default = 'bolt://localhost:7687', help = 'host address')
  flags.DEFINE_string('user', default = 'neo4j', help = 'user name')
  flags.DEFINE_string('password', default = 'neo4j', help = 'password')
  flags.DEFINE_string('db', default = 'neo4j', help = 'database')

def main(unused_argv):
  driver = GraphDatabase.driver(FLAGS.host, auth = (FLAGS.user, FLAGS.password))
  records, summary, keys = driver.execute_query('match (a: Author) return a as author', database_ = FLAGS.db)
  matches = [record['author'] for record in records]
  authors = dict()
  for match in matches:
    authors[match.element_id] = match._properties['name']
  weights = np.zeros((len(authors), len(authors)))
  for idx1, (id1, name1) in enumerate(authors.items()):
    for idx2, (id2, name2) in enumerate(authors.items()):
      if id1 == id2: continue
      records, summary, keys = driver.execute_query('match (a: Author)-[:CONTRIBUTES_TO]->(c: Paper)<-[:CONTRIBUTES_TO]-(b: Author) where elementid(a) = $id1 and elementid(b) = $id2 return c as paper', id1 = id1, id2 = id2, database_ = FLAGS.db)
      papers = [record['paper'] for record in records]
      weight = np.sum([record.cited for record in records])
      weights[idx1, idx2] = weight
  np.save('weights.npy', weights)

if __name__ == "__main__":
  add_options()
  app.run(main)

