#!/usr/bin/python3

from absl import flags, app
from tqdm import tqdm
from os import walk
from os.path import exists, join, splitext
import json

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('input_dir', default = None, help = 'path to input directory')
  flags.DEFINE_string('output', default = 'triplet_output.cypher', help = 'output cypher file')

def add_triplet(electrolyte, value, tag, filename):
  cypher = """merge (a: SULFIDE_ELECTROLYTE {name: \"%s\"}) return a;
merge (a: %s {value: \"%s\"}) return a;
match (a: SULFIDE_ELECTROLYTE {name: \"%s\"}), (b: %s {value: \"%s\"}) merge (a)-[r:HAS_ATTRIBUTE]-(b)
set r.source = \"%s\";
""" % (electrolyte, tag, value, electrolyte, tag, value, filename)
  return cypher

def main(unused_argv):
  output = open(FLAGS.output, 'w')
  for root, dirs, files in tqdm(walk(FLAGS.input_dir)):
    for f in files:
      stem, ext = splitext(f)
      if ext != '.json': continue
      with open(join(root, f), 'r') as f:
        metadata = json.loads(f.read())
      filename = metadata['filename']
      for triplet in metadata['triplets']:
        electrolyte, attribute = triplet
        cypher = add_triplet(electrolyte['value'], attribute['value'], attribute['entity'], filename)
        output.write(cypher)
  output.close()

if __name__ == "__main__":
  add_options()
  app.run(main)

