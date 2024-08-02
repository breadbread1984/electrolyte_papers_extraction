#!/usr/bin/python3

from absl import flags, app
from shutil import rmtree
import json
from os import walk, mkdir
from os.path import splitext, join, exists
from tqdm import tqdm
from ner import PDFNER

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('input_dir', default = None, help = 'path to directory containing pdfs')
  flags.DEFINE_string('output_dir', default = 'output', help = 'path to output directory')
  flags.DEFINE_string('ckpt', default = None, help = 'path to checkpoint')
  flags.DEFINE_enum('framework', default = 'huggingface', enum_values = {'huggingface', 'adaseq'}, help = 'which framework is used')
  flags.DEFINE_enum('device', default = 'gpu', enum_values = {'gpu', 'cpu'}, help = 'device')

def main(unused_argv):
  if exists(FLAGS.output_dir): rmtree(FLAGS.output_dir)
  mkdir(FLAGS.output_dir)
  ner = PDFNER(FLAGS.ckpt, framework = FLAGS.framework, device = FLAGS.device)
  for root, dirs, files in tqdm(walk(FLAGS.input_dir)):
    for f in files:
      stem, ext = splitext(f)
      if ext != '.pdf': continue
      metadata = ner.process(join(root,f))
      with open(join(FLAGS.output_dir, stem + '.json'), 'w') as f:
        f.write(json.dumps(metadata, indent = 2, ensure_ascii = False))

if __name__ == "__main__":
  add_options()
  app.run(main)

