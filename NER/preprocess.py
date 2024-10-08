#!/usr/bin/python3

from absl import flags, app
from shutil import rmtree
from tqdm import tqdm
from uuid import uuid4
from os import mkdir, walk
from os.path import exists, isdir, join, splitext
import pandas as pd
from langchain.document_loaders import UnstructuredPDFLoader, UnstructuredHTMLLoader, TextLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('input_dir', default = None, help = 'path to input directory')
  flags.DEFINE_string('output_dir', default = 'output', help = 'path to output directory')
  flags.DEFINE_integer('length', default = 500, help = 'sample sentence length')
  flags.DEFINE_string('list', default = None, help = 'path to xls of papers')

def main(unused_argv):
  if exists(FLAGS.output_dir): rmtree(FLAGS.output_dir)
  mkdir(FLAGS.output_dir)
  paper_list = None if FLAGS.list is None else pd.ExcelFile(FLAGS.list).parse(0)
  text_splitter = RecursiveCharacterTextSplitter(chunk_size = FLAGS.length, chunk_overlap = 0)
  for root, dirs, files in tqdm(walk(FLAGS.input_dir)):
    for f in files:
      stem, ext = splitext(f)
      idx = int(stem.split('-')[0])
      if FLAGS.list is not None:
        assert paper_list.iloc[idx - 1]['序号'] == idx
        doi = paper_list.iloc[idx - 1]['DOI']
        doi = doi.replace('/','_') if type(doi) is str else doi
      else:
        doi = None
      output_name = (str(uuid4()) if (FLAGS.list is None or type(doi) is not str) else doi) + '.txt'
      if ext.lower() in ['.htm', '.html']:
        loader = UnstructuredHTMLLoader(join(root, f))
      elif ext.lower() == '.txt':
        loader = TextLoader(join(root, f))
      elif ext.lower() == '.pdf':
        loader = UnstructuredPDFLoader(join(root, f), mode = 'single')
      else:
        raise Exception('unknown format!')
      docs = loader.load()
      split_docs = text_splitter.split_documents(docs)
      with open(join(FLAGS.output_dir, output_name), 'w') as f:
        for doc in split_docs:
          content = doc.page_content.replace('\n','')
          f.write(content + '\n')

if __name__ == "__main__":
  add_options()
  app.run(main)

