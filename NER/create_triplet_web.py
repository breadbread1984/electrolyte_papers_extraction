#!/usr/bin/python3

from absl import flags, app
from tqdm import tqdm
from os import walk
from os.path import exists, join, splitext
import json

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('input_dir', default = None, help = 'path to input directory')
  flags.DEFINE_string('output', default = 'attribute_output.cypher', help = 'output cypher file')

def main(unused_argv):
  output = open(FLAGS.output, 'w')
  for root, dirs, file
