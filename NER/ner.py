#!/usr/bin/python3

from os.path import abspath, splitext, basename
import modelscope
import transformers
from transformers import AutoTokenizer
from modelscope.utils.constant import Tasks
from langchain.document_loaders import UnstructuredPDFLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter

class NER(object):
  def __init__(self, ckpt, framework = 'huggingface', device = 'gpu'):
    assert device in {'gpu', 'cpu'}
    assert framework in {'huggingface', 'adaseq'}
    if framework == 'adaseq':
      self.pipeline = modelscope.pipelines.pipeline(Tasks.named_entity_recognition, abspath(ckpt), device = device)
    elif framework == 'huggingface':
      self.pipeline = transformers.pipeline('ner', ckpt, tokenizer = AutoTokenizer.from_pretrained('google-bert/bert-base-cased'))
  def process(self, text):
    results = self.pipeline(text)
    return results

class PDFNER(NER):
  def __init__(self, ckpt, device = 'gpu', chunk_size = 500, chunk_overlap = 0):
    super(PDFNER, self).__init__(ckpt, device)
    self.splitter = RecursiveCharacterTextSplitter(chunk_size = chunk_size, chunk_overlap = chunk_overlap)
  def process(self, pdf):
    stem, ext = splitext(basename(pdf))
    if ext != '.pdf': raise Exception('it is not a pdf file!')
    loader = UnstructuredPDFLoader(pdf, mode = 'single')
    docs = loader.load()
    sentences = [sentence.page_content for sentence in self.splitter.split_documents(docs)]
    for sentence in sentences:
      results = self.pipeline(sentence)

if __name__ == "__main__":
  ner = NER('ckpt', device = 'gpu')
  results = ner.process('')
  import pdb; pdb.set_trace()
