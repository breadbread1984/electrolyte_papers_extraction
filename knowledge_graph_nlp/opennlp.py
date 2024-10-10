#!/usr/bin/python3

from os.path import join, exists
import jpype
import jpype.imports
from jpype.types import *
from nltk.tree import Tree
from wget import download

class OpenNLP(object):
  def __init__(self,):
    if not exists('en-token.bin'): download('https://opennlp.sourceforge.net/models-1.5/en-token.bin', out = '.')
    if not exists('en-sent.bin'): download('https://opennlp.sourceforge.net/models-1.5/en-sent.bin', out = '.')
    if not exists('en-ner-date.bin'): download('https://opennlp.sourceforge.net/models-1.5/en-ner-date.bin', out = '.')
    if not exists('en-ner-location.bin'): download('https://opennlp.sourceforge.net/models-1.5/en-ner-location.bin', out = '.')
    if not exists('en-ner-money.bin'): download('https://opennlp.sourceforge.net/models-1.5/en-ner-money.bin', out = '.')
    if not exists('en-ner-organization.bin'): download('https://opennlp.sourceforge.net/models-1.5/en-ner-organization.bin', out = '.')
    if not exists('en-ner-percentage.bin'): download('https://opennlp.sourceforge.net/models-1.5/en-ner-percentage.bin', out = '.')
    if not exists('en-ner-person.bin'): download('https://opennlp.sourceforge.net/models-1.5/en-ner-person.bin', out = '.')
    if not exists('en-ner-time.bin'): download('https://opennlp.sourceforge.net/models-1.5/en-ner-time.bin', out = '.')
    if not exists('en-pos-maxent.bin'): download('https://opennlp.sourceforge.net/models-1.5/en-pos-maxent.bin', out = '.')
    if not exists('en-parser-chunking.bin'): download('https://opennlp.sourceforge.net/models-1.5/en-parser-chunking.bin', out = '.')
    jpype.startJVM(classpath = ['/usr/share/java/org.jpype-1.3.0.jar','/usr/share/java/opennlp-tools.jar'])
    self.FileInputStream = jpype.JClass('java.io.FileInputStream')
    self.TokenizerModel = jpype.JClass('opennlp.tools.tokenize.TokenizerModel')
    self.TokenizerME = jpype.JClass('opennlp.tools.tokenize.TokenizerME')
    self.TokenNameFinderModel = jpype.JClass('opennlp.tools.namefind.TokenNameFinderModel')
    self.SentenceModel = jpype.JClass('opennlp.tools.sentdetect.SentenceModel')
    self.SentenceDetectorME = jpype.JClass('opennlp.tools.sentdetect.SentenceDetectorME')
    self.NameFinderME = jpype.JClass('opennlp.tools.namefind.NameFinderME')
    self.POSModel = jpype.JClass('opennlp.tools.postag.POSModel')
    self.POSTaggerME = jpype.JClass('opennlp.tools.postag.POSTaggerME')
    self.ParserModel = jpype.JClass('opennlp.tools.parser.ParserModel')
    self.ParserFactory = jpype.JPackage('opennlp.tools.parser').ParserFactory
    self.ParserTool = jpype.JPackage('opennlp.tools.cmdline.parser').ParserTool
    self.StringBuffer = jpype.JClass('java.lang.StringBuffer')
    self.tokenizer = self.TokenizerME(self.TokenizerModel(self.FileInputStream('en-token.bin')))
    self.sentence_detector = self.SentenceDetectorME(self.SentenceModel(self.FileInputStream('en-sent.bin')))
  def ner(self, text):
    models = {
      'date': self.NameFinderME(self.TokenNameFinderModel(self.FileInputStream('en-ner-date.bin'))),
      'location': self.NameFinderME(self.TokenNameFinderModel(self.FileInputStream('en-ner-location.bin'))),
      'money': self.NameFinderME(self.TokenNameFinderModel(self.FileInputStream('en-ner-money.bin'))),
      'organization': self.NameFinderME(self.TokenNameFinderModel(self.FileInputStream('en-ner-organization.bin'))),
      'percentage': self.NameFinderME(self.TokenNameFinderModel(self.FileInputStream('en-ner-percentage.bin'))),
      'person': self.NameFinderME(self.TokenNameFinderModel(self.FileInputStream('en-ner-person.bin'))),
      'time': self.NameFinderME(self.TokenNameFinderModel(self.FileInputStream('en-ner-time.bin'))),
    }
    tokens = self.tokenizer.tokenize(JString(text))
    entities = list()
    for name_type, finder in models.items():
      names = finder.find(tokens)
      for name in names:
        entities.append({
          'entity': str(tokens[name.getStart()]),
          'type': str(name.getType()),
          'start': int(name.getStart()),
          'end': int(name.getEnd())
        })
    return entities
  def pos(self, text):
    tagger = self.POSTaggerME(self.POSModel(self.FileInputStream('en-pos-maxent.bin')))
    tokens = self.tokenizer.tokenize(JString(text))
    tags = [str(tag) for tag in tagger.tag(tokens)]
    return tags
  def parse(self, text):
    parser = self.ParserFactory.create(self.ParserModel(self.FileInputStream('en-parser-chunking.bin')))
    sentences = self.sentence_detector.sentDetect(JString(text))
    results = list()
    for sentence in sentences:
      parses = self.ParserTool.parseLine(sentence, parser, 1)
      for parse in parses:
        sb = self.StringBuffer()
        parse.show(sb)
        results.append(Tree.fromstring(str(sb.toString())))
    return results
  def extract_triplets_from_sentence(self, tree):
    triplets = list()
    subject = None
    predicate = None
    obj = None
    
    for subtree in tree:
        if type(subtree) is str:
            # skip terminal node
            continue
        # find object, predicate, subject in this subtree
        if subtree.label() == 'NP' and not subject:
            # generate object from noun phrase
            subject = ' '.join(subtree.leaves())
        elif subtree.label() == 'VP':
            # generate predicate and subject from verb phrase
            for vp_subtree in subtree:
                if type(vp_subtree) is str: continue
                if vp_subtree.label().startswith('V'):
                    predicate = ' '.join(vp_subtree.leaves())
                elif vp_subtree.label() in ['NP', 'PP']:
                    # both noun phrase and preposition phrase can be subject
                    obj = ' '.join(vp_subtree.leaves())
        # if this is a non-terminal node, recursively generate triplets among its children
        if len(subtree) > 0:
            triplets.extend(self.extract_triplets_from_sentence(subtree))
    if subject and predicate and obj:
        triplets.append((subject, predicate, obj))
    
    return triplets
  def triplets(self, tree):
    triplets_by_sentence = list()
    assert type(tree) is list
    for s in tree:
      triplets = self.extract_triplets_from_sentence(s)
      triplets_by_sentence.append({'triplets': triplets, 'sentence': ' '.join(s.leaves())})
    return triplets_by_sentence

if __name__ == "__main__":
  opennlp = OpenNLP()
  res = opennlp.ner('Figure 5. Kinetic characteristic tests of chemical reaction between Li1–xCoO2(x= 0, 0.3, 0.5) and typical sulfide SEs. (a) DSC curves of the Li1–xCoO2+ Li6PS5Cl mixed powder at different heating rates (3, 5, 7, 15, 20 °C/min).')
  print(res)
  res = opennlp.pos('Figure 5. Kinetic characteristic tests of chemical reaction between Li1–xCoO2(x= 0, 0.3, 0.5) and typical sulfide SEs. (a) DSC curves of the Li1–xCoO2+ Li6PS5Cl mixed powder at different heating rates (3, 5, 7, 15, 20 °C/min).')
  print(res)
  res = opennlp.parse('Figure 5. Kinetic characteristic tests of chemical reaction between Li1–xCoO2(x= 0, 0.3, 0.5) and typical sulfide SEs. (a) DSC curves of the Li1–xCoO2+ Li6PS5Cl mixed powder at different heating rates (3, 5, 7, 15, 20 °C/min).')
  for tree in res:
    print(tree)
  res = opennlp.triplets(res)
  print(res)
