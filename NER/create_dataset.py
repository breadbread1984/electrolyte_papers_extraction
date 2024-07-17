#!/usr/bin/python3

import json
from shutil import rmtree
from os import listdir, mkdir
from os.path import join, exists, splitext
from absl import flags, app
import numpy as np
from transformers import AutoTokenizer

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('input', default = None, help = 'path to spacy label file')
  flags.DEFINE_string('output', default = 'converted.jsonl', help = 'path to adaseq label file')
  flags.DEFINE_enum('model', default = 'bert', enum_values = {'bert',}, help = 'llm model')

def main(unused_argv):
  model_name = {'bert': 'google-bert/bert-base-cased'}[FLAGS.model]
  tokenizer = AutoTokenizer.from_pretrained(model_name)
  samples = list()
  with open(FLAGS.input, 'r') as fp:
    spacy_labels = json.loads(fp.read())
  token_tags = spacy_labels['classes'] # list
  annotations = spacy_labels['annotations'] # list
  for sample in annotations:
    text = sample[0]
    entities = sample[1]['entities']
    tokens = tokenizer.backend_tokenizer.pre_tokenizer.pretokenize_str(text)
    ner_tags = ['O' for token in tokens]
    for e in entities:
      begin = e[0]
      end = e[1]
      entity_tokens = tokenizer.backend_tokenizer.pre_tokenizer.pre_tokenize_str(text[begin:end])
      entity_tokens = [(token[0], (token[1][0] + begin, token[1][1] + begin)) for token in entity_tokens]
      for idx, token in enumerate(entity_tokens):
        tag = e[2]
        ner_tags[tokens.index((token[0], (token[1][0], token[1][1])))] = \
          ('S-' + tag) if idx == 0 and idx == len(entity_tokens) - 1 else \
          ('B-' + tag) if idx == 0 else \
          ('E-' + tag) if idx == len(entity_tokens) - 1 else \
          ('I-' + tag)
    samples.append({'text': [token[0] for token in tokens], 'labels': ner_tags})
  with open(FLAGS.output, 'w') as f:
    for sample in samples:
      f.write(json.dumps(sample, ensure_ascii = False, indent = 2) + '\n')

if __name__ == "__main__":
  add_options()
  app.run(main)

