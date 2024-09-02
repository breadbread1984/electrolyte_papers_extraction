#!/usr/bin/python3

from absl import flags, app
from tqdm import tqdm
from os import walk
from os.path import exists, join, splitext
import json

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('input_dir', default = None, help = 'path to input directory')
  flags.DEFINE_string('output', default = 'entity_output.cypher', help = 'output cypher file')
  flags.DEFINE_list('labels', default = ["SULFIDE_ELECTROLYTE","IONIC_CONDUCTIVITY","CURRENT_DENSITY","ENERGY_DENSITY","STRUCTURE"], help = 'concerned labels')

def add_label(label):
  cypher = """merge (a: Label {label: "%s"}) return a;""" % (label,)
  return cypher

def add_value(value, paper):
  cypher = """merge (a: Value {value: "%s", source: "%s"}) return a;""" % (value, paper)
  return cypher

def link_label_value(label, value, paper):
  cypher = """match (a: Label {label: "%s"}), (b: Value {value: "%s", source: "%s"}) merge (a)-[:INCLUDES]->(b);""" % (label, value, paper)
  return cypher

def main(unused_argv):
  output = open(FLAGS.output, 'w')
  for label in FLAGS.labels:
    output.write(add_label(label) + '\n')
  for root, dirs, files in tqdm(walk(FLAGS.input_dir)):
    for f in files:
      stem, ext = splitext(f)
      if ext != '.json': continue
      with open(join(root, f), 'r') as f:
        metadata = json.loads(f.read())
      for sentence in metadata['sentences']:
        if len(sentence['entities']) == 0: continue
        for entity in sentence['entities']:
          output.write(add_value(entity['value'], metadata['filename']) + '\n')
          output.write(link_label_value(entity['entity'], entity['value'], metadata['filename']) + '\n')
  output.close()

if __name__ == "__main__":
  add_options()
  app.run(main)

