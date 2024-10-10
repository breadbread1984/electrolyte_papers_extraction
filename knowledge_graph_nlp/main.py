#!/usr/bin/python3

from shutil import rmtree
from os import walk, mkdir
from os.path import splitext, join, exists
from absl import flags, app
from tqdm import tqdm
from nltk.tree import Tree
import json
from langchain.document_loaders import UnstructuredPDFLoader, UnstructuredHTMLLoader, TextLoader, UnstructuredMarkdownLoader
import pickle
from oscar import Oscar4
from corenlp import CoreNLP
from opennlp import OpenNLP

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('input_dir', default = None, help = 'path to input directory')
  flags.DEFINE_string('output', default = 'out.cypher', help = 'path to output cypher file')
  flags.DEFINE_enum('method', default = 'corenlp', enum_values = {'oscar', 'corenlp', 'opennlp'}, help = 'which method to use for triplet extraction')

def main(unused_argv):
  if FLAGS.method == 'oscar':
    oscar = Oscar4()
  elif FLAGS.method == 'corenlp':
    corenlp = CoreNLP()
  elif FLAGS.method == 'opennlp':
    opennlp = OpenNLP()
  else:
    raise Exception('unknown method!')
  f = open(FLAGS.output, 'w')
  for root, dirs, files in tqdm(walk(FLAGS.input_dir)):
    for f in files:
      stem, ext = splitext(f)
      if ext.lower() in ['.htm','.html']:
        loader = UnstructuredHTMLLoader(join(root, f))
      elif ext.lower() == '.txt':
        loader = TextLoader(join(root, f))
      elif ext.lower() == '.pdf':
        loader = UnstructuredPDFLoader(join(root, f), mode = 'single')
      elif ext.lower() == '.md':
        loader = UnstructuredMarkdownLoader(join(root, f), mode = 'single', strategy = 'fast')
      else:
        raise Exception('unknown format!')
      text = ' '.join([doc.page_content for doc in loader.load()])
      if FLAGS.mthod == 'oscar':
        tree = oscar.parse(text)
        triplets = oscar.triplets(tree)
      elif FLAGS.method == 'opennlp':
        tree = opennlp.parse(text)
        triplets = opennlp.triplets(tree)
      elif FLAGS.method == 'corenlp':
        triplets = corenlp.triplets(text)
      else:
        raise Exception('unknown method!')
      for sentence in triplets:
        for triplet in sentence:
          f.write("merge (a: Entity {text: \"%s\"}) return a;\n" % triplet[0])
          f.write("merge (a: Entity {text: \"%s\"}) return a;\n" % triplet[2])
          f.write("match (a: Entity {text: \"%s\"}), (b: Entity {text: \"%s\"}) merge (a)-[r:RELATION]->(b) set r.text = \"%s\";\n" % (triplet[0], triplet[2], triplet[1]))
  f.close()

if __name__ == "__main__":
  add_options()
  app.run(main)

