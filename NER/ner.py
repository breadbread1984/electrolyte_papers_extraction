#!/usr/bin/python3

from os.path import abspath, splitext, basename
import modelscope
import transformers
from transformers import AutoTokenizer
from modelscope.utils.constant import Tasks
from langchain.document_loaders import UnstructuredPDFLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter

class NER(object):
  def __init__(self, ckpt, framework = 'huggingface', device = 'cuda'):
    assert device in {'cuda', 'cpu'}
    assert framework in {'huggingface', 'adaseq'}
    if framework == 'adaseq':
      self.pipeline = modelscope.pipelines.pipeline(Tasks.named_entity_recognition, abspath(ckpt), device = device)
    elif framework == 'huggingface':
      self.pipeline = transformers.pipeline('ner', ckpt, tokenizer = AutoTokenizer.from_pretrained('google-bert/bert-base-cased'), device = device)
  def process(self, text):
    entities = list()
    tokens = self.pipeline(text)
    print(tokens)
    if len(tokens) == 0: return entities
    for idx, token in enumerate(tokens):
      if token['word'].startswith('##'): token['word'] = token['word'][2:]
      if idx == 0:
        entities.append({
          'entity': token['entity'][2:],
          'value': token['word'],
          'start': token['start'],
          'end': token['end']
        })
      else:
        if token['entity'][2:] == entities[-1]['entity'] and \
           (token['start'] == entities[-1]['end'] or token['start'] == entities[-1]['end'] + 1):
          entities[-1]['end'] = token['end']
          entities[-1]['value'] = text[entities[-1]['start']:entities[-1]['end']]
        else:
          entities.append({
            'entity': token['entity'][2:],
            'value': token['word'],
            'start': token['start'],
            'end': token['end']
          })
          
    return entities

class PDFNER(NER):
  def __init__(self, ckpt, framework = 'huggingface', device = 'gpu', chunk_size = 300, chunk_overlap = 0):
    super(PDFNER, self).__init__(ckpt, framework, device)
    self.splitter = RecursiveCharacterTextSplitter(chunk_size = chunk_size, chunk_overlap = chunk_overlap)
  def process(self, pdf):
    metadata = dict()
    stem, ext = splitext(basename(pdf))
    metadata['filename'] = stem
    metadata['sentences'] = list()
    if ext != '.pdf': raise Exception('it is not a pdf file!')
    loader = UnstructuredPDFLoader(pdf, mode = 'single')
    docs = loader.load()
    sentences = [sentence.page_content for sentence in self.splitter.split_documents(docs)]
    for sentence in sentences:
      sentence_metadata = dict()
      sentence_metadata['text'] = sentence
      entities = super(PDFNER,self).process(sentence)
      sentence_metadata['entities'] = entities
      metadata['sentences'].append(sentence_metadata)
    return metadata

if __name__ == "__main__":
  ner = NER('hf_ckpt', framework = 'huggingface', device = 'cuda')
  s = 'was used as electrode ma- terials: a 80Li2Se20P2S5 solid electrolyte with an Li:P molar ratio of 8:2 or a 70Li2Se30P2S5 solid electrolyte with an Li:P molar ratio of 7:3 for the positive-electrode, and a 70Li2Se30P2S5 solid electrolyte for the negative-electrode. The synthetic condition of these'
  results = ner.process(s)
  print('original text: ', s)
  print('entities: ', results)
