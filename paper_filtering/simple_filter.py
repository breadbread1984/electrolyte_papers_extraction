#!/usr/bin/python3

from absl import flags, app
from os import walk
from os.path import join, exists, splitext
import json
from tqdm import tqdm
from langchain.document_loaders import UnstructuredPDFLoader

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('input_dir', default = None, help = 'path to directory containing papers')
  flags.DEFINE_string('output_json', default = 'output.json', help = 'path to output json')

def main(unused_argv):
  unrelevant_files = list()
  for root, dirs, files in tqdm(walk(FLAGS.input_dir)):
    for f in files:
      stem, ext = splitext(f)
      if ext != '.pdf': continue
      loader = UnstructuredPDFLoader(join(root, f), mode = 'single')
      text = ''.join([doc.page_content for doc in loader.load()])
      relevant = text.find('sulfide') >= 0 and text.find('electrolyte') >= 0
      unrelevant_files.append(join(root, f))
  with open(FLAGS.output_json, 'w') as f:
    f.write(json.dumps(unrelevant_files))

if __name__ == "__main__":
  add_options()
  app.run(main)

