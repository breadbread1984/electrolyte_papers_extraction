#!/usr/bin/python3

from absl import flags, app
from os.path import splitext, join
from langchain.document_loaders import UnstructuredPDFLoader, UnstructuredHTMLLoader, TextLoader
from models import Mamba
from chains import stuff_chain

FLAGS = flags.FLAGS

def add_options():
  flags.DEFINE_string('input', default = None, help = 'path to input paper')
  flags.DEFINE_string('output', default = 'output.txt', help = 'path to output')
  flags.DEFINE_enum('device', default = 'cuda', enum_values = {'cpu', 'cuda'}, help = 'device to use')

def main(unused_argv):
  stem, ext = splitext(FLAGS.input)
  if ext.lower() in ['.htm', '.html']:
    loader = UnstructuredHTMLLoader(join(root, FLAGS.input))
  elif ext.lower() == '.txt':
    loader = TextLoader(join(root, FLAGS.input))
  elif ext.lower() == '.pdf':
    loader = UnstructuredPDFLoader(FLAGS.input, mode = 'single')
  else:
    raise Exception('unknown format!')
  text = ''.join([doc.page_content for doc in loader.load()])
  llm = Mamba(FLAGS.device)
  tokenizer = llm.tokenizer
  stuff_chain_ = stuff_chain(tokenizer, llm)
  conductivity = stuff_chain_.invoke({'context': text, 'question': 'what is the ionic conductivity of the electrolyte introduced in the paper?'})
  window = stuff_chain_.invoke({'context': text, 'question': 'what is the electronchemical stability window of the electrolyte introduced in the paper?'})
  strength = stuff_chain_.invoke({'context': text, 'question': 'what is the mechanical strength of the electrolyte introduced in the paper?'})
  print(conductivity)
  print(window)
  print(strength)

if __name__ == "__main__":
  add_options()
  app.run(main)

