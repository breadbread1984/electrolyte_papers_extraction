#!/usr/bin/python3

from absl import flags, app
from shutil import rmtree
from tqdm import tqdm
from uuid import uuid4
from os import mkdir, walk
from os.path import exists, isdir, join, splitext
from langchain.document_loaders import UnstructuredPDFLoader, UnstructuredHTMLLoader, TextLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('input_dir', default = None, help = 'path to input directory')
  flags.DEFINE_string('output_dir', default = 'output', help = 'path to output directory')
  flags.DEFINE_integer('length', default = 500, help = 'sample sentence length')

def main(unused_argv):
  if exists(FLAGS.output_dir): rmtree(FLAGS.output_dir)
  mkdir(FLAGS.output_dir)
  text_splitter = RecursiveCharacterTextSplitter(chunk_size = FLAGS.length, chunk_overlap = 0)
  for root, dirs, files in tqdm(walk(FLAGS.input_dir)):
    for f in files:
      stem, ext = splitext(f)
      if ext.lower() in ['.htm', '.html']:
        loader = UnstructuredHTMLLoader(join(root, f))
      elif ext.lower() == '.txt':
        loader = TextLoader(join(root, f))
      elif ext.lower() == '.pdf':
        loader = UnstructuredPDFLoader(join(root, f), mode = 'single', strategy = "hi_res")
      else:
        raise Exception('unknown format!')
      docs = loader.load()
      split_docs = text_splitter.split_documents(docs)
      with open(join(FLAGS.output_dir, str(uuid4())), 'w') as f:
        for doc in split_docs if len(doc.page_content) > 100:
          content = doc.page_content.replace('\n','')
          f.write(content + '\n')

if __name__ == "__main__":
  add_options()
  app.run(main)

