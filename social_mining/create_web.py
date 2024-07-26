#!/usr/bin/python3

from absl import flags, app
from os.path import join, exists
from pybtex.database import parse_file
import pandas as pd
import subprocess

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('list', default = None, help = 'path to list of papers')
  flags.DEFINE_string('paper_dir', default = None, help = 'path to the directory of pdfs')
  flags.DEFINE_string('output', default = 'output.cypher', help = 'output cypher file')

def add_author(author, researcher_id):
  cypher = """merge (c: Author {name: "%s", researcher_id: "%s"}) return c;
""" % (author, researcher_id)
  return cypher

def add_paper(title, doi):
  cypher = """merge (c: Paper {title: "%s", doi: "%s"}) return c;
""" % (title, doi)
  return cypher

def add_paper_author(doi, researcher_id):
  cypher = """match (a: Author {researcher_id: "%s"}),
(b: Paper {doi: "%s"})
merge (a)-[:CONTRIBUTES_TO]->(b);
""" % (researcher_id, doi)
  return cypher

def main(unused_argv):
  xls = pd.ExcelFile(FLAGS.list)
  sheet = xls.parse(0)
  # 1) add author, paper nodes
  # add author-paper relationship
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
  # 2) add author citation relationship
  for i in sheet.index:
    idx = sheet.iloc[i]['序号']
    title = sheet.iloc[i]['Article Title']
    pdf_path = join(FLAGS.paper_dir, f"{idx}-{title}.pdf")
    if not exists(pdf_path): continue
    output = subprocess.check_output('anystyle -f bib find "%s"' % pdf_path, shell = True, text = True)
    with open('tmp.bib','w') as f:
      f.write(output)
    bib_data = parse_file('tmp.bib')
    for k, v in bib_data.entries.items():
      if len(v.persons) == 0: continue
      authors = v.persons['author']

if __name__ == "__main__":
  add_options()
  app.run(main)

