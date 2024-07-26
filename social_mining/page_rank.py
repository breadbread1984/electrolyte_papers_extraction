#!/usr/bin/python3

from absl import flags, app
from neo4j import GraphDatabase

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('host', default = 'bolt://localhost:7687', help = 'host address')
  flags.DEFINE_string('user', default = 'neo4j', help = 'user name')
  flags.DEFINE_string('password', default = 'neo4j', help = 'password')
  flags.DEFINE_string('db', default = 'neo4j', help = 'database')

def main(unused_argv):
  driver = GraphDatabase.driver(FLAGS.host, auth = (FLAGS.user, FLAGS.password))
  records, summary, keys = driver.execute_query('match (a: Author) return a as author', database_ = FLAGS.db)
  matched = [record['author'] for record in records]

if __name__ == "__main__":
  add_options()
  app.run(main)

