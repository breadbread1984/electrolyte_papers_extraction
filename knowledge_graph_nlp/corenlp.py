#!/usr/bin/python3

from os.path import join, exists
import jpype
import jpype.imports
from jpype.types import *
from nltk.tree import Tree
from wget import download

class CoreNLP(object):
  def __init__(self,):
    if not exists('ejml-core-0.39.jar'): download('https://repo1.maven.org/maven2/org/ejml/ejml-core/0.39/ejml-core-0.39.jar', out = '.')
    if not exists('ejml-simple-0.39.jar'): download('https://repo1.maven.org/maven2/org/ejml/ejml-simple/0.39/ejml-simple-0.39.jar', out = '.')
    if not exists('ejml-ddense-0.39.jar'): download('https://repo1.maven.org/maven2/org/ejml/ejml-ddense/0.39/ejml-ddense-0.39.jar', out = '.')
    if not exists('protobuf-java-3.19.6.jar'): download('https://repo1.maven.org/maven2/com/google/protobuf/protobuf-java/3.19.6/protobuf-java-3.19.6.jar', out = '.')
    if not exists('stanford-corenlp-4.5.7.jar'): download('https://repo1.maven.org/maven2/edu/stanford/nlp/stanford-corenlp/4.5.7/stanford-corenlp-4.5.7.jar', out = '.')
    if not exists('stanford-corenlp-4.5.7-models.jar'): download('https://repo1.maven.org/maven2/edu/stanford/nlp/stanford-corenlp/4.5.7/stanford-corenlp-4.5.7-models.jar', out = '.')
    if not exists('stanford-corenlp-4.5.7-models-english.jar'): download('https://repo1.maven.org/maven2/edu/stanford/nlp/stanford-corenlp/4.5.7/stanford-corenlp-4.5.7-models-english.jar', out = '.')
    jpype.startJVM(classpath = ['/usr/share/java/org.jpype-1.3.0.jar','./ejml-core-0.39.jar','./ejml-simple-0.39.jar','./ejml-ddense-0.39.jar','protobuf-java-3.19.6.jar','stanford-corenlp-4.5.7.jar','stanford-corenlp-4.5.7-models.jar','stanford-corenlp-4.5.7-models-english.jar'])
    self.Properties = jpype.JClass('java.util.Properties')
    self.StanfordCoreNLP = jpype.JClass('edu.stanford.nlp.pipeline.StanfordCoreNLP')
    self.Annotation = jpype.JClass('edu.stanford.nlp.pipeline.Annotation')
    self.Class = jpype.JPackage('java.lang').Class
    self.String = jpype.JClass('java.lang.String')
  def ner(self, text):
    props = self.Properties()
    props.setProperty('annotators', "tokenize,ssplit,pos,lemma,regexner")
    props.setProperty('regexner.mapping','electrolyte_ner.txt')
    pipeline = self.StanfordCoreNLP(props)
    text = self.String(text)
    document = self.Annotation(text)
    pipeline.annotate(document)
    sentences = list()
    for sentence in document.get(self.Class.forName(self.String('edu.stanford.nlp.ling.CoreAnnotations$SentencesAnnotation'))):
      entities = list()
      for token in sentence.get(self.Class.forName(self.String('edu.stanford.nlp.ling.CoreAnnotations$TokensAnnotation'))):
        entity = token.get(self.Class.forName(self.String('edu.stanford.nlp.ling.CoreAnnotations$TextAnnotation')))
        tag = token.get(self.Class.forName(self.String('edu.stanford.nlp.ling.CoreAnnotations$NamedEntityTagAnnotation')))
        entities.append((str(entity), str(tag)))
      sentences.append({'entities': entities, 'original sentence': str(sentence)})
    return sentences
  def parse(self, text):
    props = self.Properties()
    props.setProperty('annotators', "tokenize,ssplit,pos,lemma,parse")
    pipeline = self.StanfordCoreNLP(props)
    text = self.String(text)
    document = self.Annotation(text)
    pipeline.annotate(document)
    sentences = list()
    for sentence in document.get(self.Class.forName(self.String('edu.stanford.nlp.ling.CoreAnnotations$SentencesAnnotation'))):
      tree = sentence.get(self.Class.forName(self.String('edu.stanford.nlp.trees.TreeCoreAnnotations$TreeAnnotation')))
      sentences.append(Tree.fromstring(str(tree.toString())))
    return sentences
  def triplets(self, text):
    props = self.Properties()
    props.setProperty('annotators', "tokenize,ssplit,pos,lemma,depparse,natlog,openie")
    pipeline = self.StanfordCoreNLP(props)
    text = self.String(text)
    document = self.Annotation(text)
    pipeline.annotate(document)
    results = list()
    for sentence in document.get(self.Class.forName(self.String('edu.stanford.nlp.ling.CoreAnnotations$SentencesAnnotation'))):
      triplets = sentence.get(self.Class.forName(self.String('edu.stanford.nlp.naturalli.NaturalLogicAnnotations$RelationTriplesAnnotation')))
      triplets = [(str(triplet.subjectLemmaGloss()),str(triplet.relationLemmaGloss()),str(triplet.objectLemmaGloss())) for triplet in triplets]
      results.append({'triplets': triplets, 'sentence': str(sentence.toString())})
    return results

if __name__ == "__main__":
  corenlp = CoreNLP()
  results = corenlp.ner("Unfortunately, despite of the advantages described above, the application of sulfide-based ASSLBs is still impeded when coupled with transitional metal oxide cathodes such as LiCoO2 and LiNixMnyCo1−x−yO2(NMC), which is attributed to the catastrophic interfacial issues including severe interfacial reaction and mechanical failure.")
  print(results)
