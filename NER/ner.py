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
      self.pipeline = transformers.pipeline('ner', ckpt, tokenizer = AutoTokenizer.from_pretrained('google-bert/bert-base-cased'), device = device)
  def process(self, text):
    entities = list()
    tokens = self.pipeline(text)
    status = 'none-appendable'
    for token in tokens:
      if token['word'].startswith('##'): token['word'] = token['word'][2:]
      if status == 'none-appendable':
        entities.append({
          'entity': token['entity'][2:],
          'value': token['word'],
          'start': token['start'],
          'end': token['end']
        })
        if token['entity'].startswith('S-') or token['entity'].startswith('E-'):
          status = 'none-appendable'
        else:
          status = 'appendable'
      else:
        if entities[-1]['entity'] == token['entity'][2:]:
          # same type of token
          if token['entity'][:2] == 'S-':
            # entity only contains one token
            entities.append({
              'entity': token['entity'][2:],
              'value': token['word'],
              'start': token['start'],
              'end': token['end']
            })
            status = 'none-appendable'
          elif token['entity'][:2] in {'B-', 'I-'}:
            # appendable token
            if entities[-1]['end'] == token['start'] or \
               entities[-1]['end'] + 1 == token['start'] and text[entities[-1]['end']] == ' ':
              # positional next to the last token
              entities[-1]['value'] += token['word'] if entities[-1]['end'] == token['start'] else (' ' + token['word'])
              entities[-1]['end'] = token['end']
              status = 'appendable'
            else:
              # positional not continued
              entities.append({
                'entity': token['entity'][2:],
                'value': token['word'],
                'start': token['start'],
                'end': token['end']
              })
              status = 'appendable'
          elif token['entity'][:2] == 'E-':
            # appendable token
            if entities[-1]['end'] == token['start'] or \
               entities[-1]['end'] + 1 == token['start'] and text[entities[-1]['end']] == ' ':
              # positional next to the last token
              entities[-1]['value'] += token['word'] if entities[-1]['end'] == token['start'] else (' ' + token['word'])
              entities[-1]['end'] = token['end']
              status = 'appendable'
            else:
              # positional not continued
              entities.append({
                'entity': token['entity'][2:],
                'value': token['word'],
                'start': token['start'],
                'end': token['end']
              })
              status = 'appendable'
          else:
            raise Exception('unknown condition!')
        else:
          entities.append({
            'entity': token['entity'][2:],
            'value': token['word'],
            'start': token['start'],
            'end': token['end']
          })
          if token['entity'][:2] in {'B-','I-'}:
            status = 'appendable'
          else:
            status = 'none-appendable'
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
      entities = self.pipeline(sentence)
      sentence_metadata['entities'] = entities
      metadata['sentences'].append(sentence_metadata)
    return metadata

if __name__ == "__main__":
  ner = NER('hf_ckpt', framework = 'huggingface', device = 'gpu')
  s = 'In particular, sulfide-based solid electrolytes that possess higher ionic conductivity than that of liquid electrolytes, such as Li9.54Si1.74P1.44S11.7Cl0.3 (2.5 × 10-2 S cm-1), Li6.6Si0.6Sb0.4S5I (2.4 × 10-2 S cm-1) and Li6.7PS5ClBr0.7 (2.4 × 10-2 S cm -1), have been developed[10-12]'
  results = ner.process(s)
  print('original text: ', s)
  print('entities: ', results)
