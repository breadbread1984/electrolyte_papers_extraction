#!/usr/bin/python3

from os.path import join, exists
import pexpect
from nltk.tree import Tree
from urllib.parse import urlparse
from wget import download

class OpenNLP(object):
  def __init__(self, task = 'POSTagger'):
    self.tasks = {
      'LanguageDetector': 'https://dlcdn.apache.org/opennlp/models/langdetect/1.8.3/langdetect-183.bin',
      'SentenceDetector': 'https://dlcdn.apache.org/opennlp/models/ud-models-1.0/opennlp-en-ud-ewt-sentence-1.0-1.9.3.bin',
      'POSTagger': 'https://dlcdn.apache.org/opennlp/models/ud-models-1.0/opennlp-en-ud-ewt-pos-1.0-1.9.3.bin',
      'TokenizerME': 'https://dlcdn.apache.org/opennlp/models/ud-models-1.0/opennlp-en-ud-ewt-tokens-1.0-1.9.3.bin',
      'Parser': 'https://opennlp.sourceforge.net/models-1.5/en-parser-chunking.bin',
    }
    model_url = self.tasks[task]
    model_file = urlparse(model_url).path.split('/')[-1]
    if not exists(model_file): download(model_url, out = '.')
    self.process = pexpect.spawn(f"{join('/','bin','opennlp')} {task} {model_file}")
    self.process.setecho(False)
    self.process.expect('done')
    self.process.expect('\r\n')
    self.task = task
  def call(self, text):
    try:
      self.process.read_nonblocking(2048, 0)
    except:
      pass
    self.process.sendline(text)
    self.process.waitnoecho()
    timeout = 5 + len(text) / 20.0
    self.process.expect('\r\n', timeout)
    results = self.process.before.decode()
    if self.task == 'POSTagger':
      parts = list()
      for token_with_part in results.split(' '):
        pos = token_with_part.rfind('_')
        content, part = token_with_part[:pos], token_with_part[pos+1:]
        parts.append((content, part))
      return parts
    elif self.task == 'TokenizerME':
      tokens = results.split(' ')
      return tokens
    elif self.task == 'Parser':
      tree = Tree.fromstring(results)
      return tree
    return results

if __name__ == "__main__":
  opennlp = OpenNLP('POSTagger')
  res = opennlp.call('Figure 5. Kinetic characteristic tests of chemical reaction between Li1–xCoO2(x= 0, 0.3, 0.5) and typical sulfide SEs. (a) DSC curves of the Li1–xCoO2+ Li6PS5Cl mixed powder at different heating rates (3, 5, 7, 15, 20 °C/min).')
  print(res)
  opennlp = OpenNLP('TokenizerME')
  res = opennlp.call('Figure 5. Kinetic characteristic tests of chemical reaction between Li1–xCoO2(x= 0, 0.3, 0.5) and typical sulfide SEs. (a) DSC curves of the Li1–xCoO2+ Li6PS5Cl mixed powder at different heating rates (3, 5, 7, 15, 20 °C/min).')
  print(res)
  opennlp = OpenNLP('Parser')
  res = opennlp.call('Figure 5. Kinetic characteristic tests of chemical reaction between Li1–xCoO2(x= 0, 0.3, 0.5) and typical sulfide SEs. (a) DSC curves of the Li1–xCoO2+ Li6PS5Cl mixed powder at different heating rates (3, 5, 7, 15, 20 °C/min).')
  print(res)
