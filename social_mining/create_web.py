#!/usr/bin/python3

from absl import flags, app
from pybtex.database.input import bibtex
import pandas as pd

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('list', default = None, help = 'path to list of papers')
  flags.DEFINE_string('paper_dir', default = None, help = 'path to the directory of pdfs')
  flags.DEFINE_string('output', default = 'output.cypher', help = 'output cypher file')

def add_author(author, researcher_id):
  cypher = """merge (c: Author {name: %s, researcher_id: %s}) return c;""" % (author, researcher_id)
  return cypher

def add_paper(title, doi):
  cypher = """merge (c: Paper {title: %s, doi: %s}) return c;""" % (title, doi)
  return cypher

def add_paper_author(doi, researcher_id):
  cypher = """match (a: Author {researcher_id: %s}),
match (b: Paper {doi: %s})
merge (a)-[:CONTRIBUTES_TO]->(b);""" % (researcher_id, doi)
  return cypher

def main(unused_argv):
  xls = pd.ExcelFile(FLAGS.list)
  sheet = xls.parse(0)
  columns = sheet.columns
  output = open(FLAGS.output, 'w')
  for i in sheet.index:
    authors = sheet.iloc[i]['Researcher Ids']
    if type(authors) is not str or authors.strip() == '': continue
    author_info = dict()
    for author in authors.split(';'):
      if author.strip() == '': continue
      name_id = author.strip().split('/')
      author, researcher_id = name_id[0], name_id[1]
      author_info[author] = researcher_id
      # add author
      output.write(add_author(author, researcher_id))
    doi = sheet.iloc[i]['DOI']
    title = sheet.iloc[i]['Article Title']
    if type(doi) is not str or doi == '' or \
       type(title) is not str or title == '': continue
    doi, title = doi.strip(), title.strip()
    # add paper
    output.write(add_paper(title, doi))
    for author, research_id in author_info.items():
      output.write(add_paper_author(doi, researcher_id))
  output.close()

if __name__ == "__main__":
  add_options()
  app.run(main)

