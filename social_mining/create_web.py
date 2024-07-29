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

def add_paper(index, title, doi, cited):
  cypher = """merge (c: Paper {index: %d, title: "%s", doi: "%s", cited: %d}) return c;
""" % (index, title, doi, cited)
  return cypher

def add_paper_author(index, author, researcher_id):
  if researcher_id != '':
    cypher = """match (a: Author {researcher_id: "%s"}),
(b: Paper {index: %d})
merge (a)-[:CONTRIBUTES_TO]->(b);
""" % (researcher_id, index)
  else:
    cypher = """match (a: Author {name: "%s"}),
(b: Paper {index: %d})
merge (a)-[:CONTRIBUTES_TO]->(b);
""" % (author, index)
  return cypher

def main(unused_argv):
  xls = pd.ExcelFile(FLAGS.list)
  sheet = xls.parse(0)
  # 1) add author, paper nodes
  # add author-paper relationship
  output = open(FLAGS.output, 'w')
  for i in sheet.index:
    authors = sheet.iloc[i]['Researcher Ids']
    author_info = dict()
    if type(authors) is str and authors.strip() != '':
      for author in authors.split(';'):
        if author.strip() == '': continue
        name_id = author.strip().split('/')
        author, researcher_id = name_id[0], name_id[1]
        author_info[author] = researcher_id
        # add author
        output.write(add_author(author, researcher_id))
    else:
      authors = sheet.iloc[i]['Authors']
      authors = '' if type(authors) is not str else authors
      for author in authors.split(';'):
        author = author.strip()
        if author == '': continue
        author_info[author] = ''
        # add author
        output.write(add_author(author, ''))
    index = sheet.iloc[i]['序号']
    doi = sheet.iloc[i]['DOI']
    title = sheet.iloc[i]['Article Title']
    cited = sheet.iloc[i]['Times Cited, All Databases']
    doi, title = str(doi).strip(), title.strip()
    # add paper
    output.write(add_paper(index, title, doi, cited))
    for author, researcher_id in author_info.items():
      output.write(add_paper_author(index, author, researcher_id))
  output.close()
  '''
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
  '''

if __name__ == "__main__":
  add_options()
  app.run(main)

