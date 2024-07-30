#!/usr/bin/python3

from absl import flags, app
from os import walk
import json
from tqdm import tqdm
from models import Llama3, Qwen2
from summarize import summarize
from prompts import relevant_template

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('input_dir', default = None, help = 'path to directory containing papers')
  flags.DEFINE_string('output_json', default = 'output.json', help = 'path to output json')
  flags.DEFINE_enum('model', default = 'llama3', enum_values = {'llama3', 'qwen2'}, help = 'model')
  flags.DEFINE_boolean('locally', default = False, help = 'whether to run model locally')
  flags.DEFINE_float('detail', default = 0, help = 'A value between 0 and 1 indicating the desired level of detail in the summary.')

def main(unused_argv):
  tokenizer, llm = {
    'llama3': Llama3,
    'qwen2': Qwen2,
  }[FLAGS.model](FLAGS.locally)
  relevant_chain = relevant_template(tokenizer) | llm | lambda message: message.replace('assistant\n\n','') if message.startswith('assistant\n\n') else message
  output = dict()
  for root, dirs, files in tqdm(walk(FLAGS.input_dir)):
    for f in files:
      stem, ext = splitext(f)
      if ext != '.pdf': continue
      loader = UnstructuredPDFLoader(join(root, f), mode = 'single')
      text = ''.join([doc.page_context for doc in loader.load()])
      summary = summarize(text, FLAGS.detail, llm = llm, tokenizer = tokenizer)
      answer = relevant_chain.invoke({'text': summary})
      output[join(root, f)] = answer
  with open(FLAGS.output_json, 'w') as f:
    f.write(json.dumps(output, indent = 2))

if __name__ == "__main__":
  add_options()
  app.run(main)
