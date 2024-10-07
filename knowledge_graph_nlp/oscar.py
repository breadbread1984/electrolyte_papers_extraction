#!/usr/bin/python3

from os import remove
from os.path import exists
import jpype
import jpype.imports
from jpype.types import *
from wget import download
import tempfile
import xml.etree.ElementTree as ET
from nltk.tree import Tree

class Oscar4(object):
  def __init__(self, ):
    if not exists('oscar4-all-5.2.0-with-dependencies.jar'): download('https://repo.maven.apache.org/maven2/uk/ac/cam/ch/wwmm/oscar/oscar4-all/5.2.0/oscar4-all-5.2.0-with-dependencies.jar', out = '.')
    if not exists('chemicalTagger-1.6.2.jar'): download('https://repo.maven.apache.org/maven2/uk/ac/cam/ch/wwmm/chemicalTagger/1.6.2/chemicalTagger-1.6.2.jar', out = '.')
    if not exists('antlr4-runtime-4.7.4.jar'): download('https://repo1.maven.org/maven2/com/tunnelvisionlabs/antlr4-runtime/4.7.4/antlr4-runtime-4.7.4.jar', out = ".")
    jpype.startJVM(classpath = ['/usr/share/java/org.jpype-1.3.0.jar','/usr/share/java/log4j-1.2-1.2.17.jar','/usr/share/java/opennlp-tools.jar','./antlr4-runtime-4.7.4.jar','./oscar4-all-5.2.0-with-dependencies.jar','./chemicalTagger-1.6.2.jar'])
    self.String = jpype.JClass('java.lang.String')
    self.List = jpype.JClass('java.util.List')
    self.Oscar = jpype.JClass('uk.ac.cam.ch.wwmm.oscar.Oscar')
    self.ResolvedNamedEntity = jpype.JClass('uk.ac.cam.ch.wwmm.oscar.chemnamedict.entities.ResolvedNamedEntity')
    self.ChemicalStructure = jpype.JClass('uk.ac.cam.ch.wwmm.oscar.chemnamedict.entities.ChemicalStructure')
    self.FormatType = jpype.JClass('uk.ac.cam.ch.wwmm.oscar.chemnamedict.entities.FormatType')
    self.POSContainer = jpype.JClass('uk.ac.cam.ch.wwmm.chemicaltagger.POSContainer')
    self.ChemistryPOSTagger = jpype.JPackage('uk.ac.cam.ch.wwmm.chemicaltagger').ChemistryPOSTagger
    self.ChemistrySentenceParser = jpype.JClass('uk.ac.cam.ch.wwmm.chemicaltagger.ChemistrySentenceParser')
    self.Utils = jpype.JClass('uk.ac.cam.ch.wwmm.chemicaltagger.Utils')
    self.Document = jpype.JClass('nu.xom.Document')
    self.types = {
      'CM': 'Compound',
      'CMS': 'Compounds',
      'GP': 'Group',
      'RN': 'Reaction',
      'CJ': 'Adjective',
      'CPR': 'Locant Prefix',
      'AHA': 'Potential Acronym',
      'ASE': 'Ase',
      'ASES': 'Ases',
      'PN': 'Proper Noun',
      'ONT': 'Ontology Term',
      'CUST': 'Custom',
      'STOP': 'Stop Word',
      'PM': 'Polymer',
      'DATA': 'Data'
    }
  def ner(self, text):
    text = self.String(text)
    oscar = self.Oscar()
    entities = oscar.findAndResolveNamedEntities(text)
    results = list()
    for i in range(entities.size()):
      entity = entities[i]
      entity_text = entity.getSurface()
      start = entity.getStart()
      end = entity.getEnd()
      type_ = entity.getType().toString()
      results.append((entity_text,start,end,self.types[type_]))
      '''
      structure = entity.getFirstChemicalStructure(self.FormatType.STD_INCHI);
      if structure != None:
        print(structure)
      '''
    return results
  def xml_to_nltk_tree(self, element):
    children = list(element)
    if not children:
        # No children, return a leaf node
        return Tree(element.tag, [element.text])
    # Return a Tree with the element's tag and its children
    return Tree(element.tag, [self.xml_to_nltk_tree(child) for child in children])
  def parse(self, text):
    text = self.String(text)
    posContainer = self.ChemistryPOSTagger.getDefaultInstance().runTaggers(text)
    chemistrySentenceParser = self.ChemistrySentenceParser(posContainer)
    chemistrySentenceParser.parseTags()
    doc = chemistrySentenceParser.makeXMLDocument()
    with tempfile.NamedTemporaryFile(delete = False, mode = 'w+', encoding = 'utf-8') as tmpfile:
      self.Utils.writeXMLToFile(doc, tmpfile.name)
      tmpfile_name = tmpfile.name
    root = ET.parse(tmpfile_name).getroot()
    tree = self.xml_to_nltk_tree(root)
    remove(tmpfile_name)
    return tree

if __name__ == "__main__":
  oscar = Oscar4()
  entities = oscar.ner('Figure 5. Kinetic characteristic tests of chemical reaction between Li1–xCoO2(x= 0, 0.3, 0.5) and typical sulfide SEs. (a) DSC curves of the Li1–xCoO2+ Li6PS5Cl mixed powder at different heating rates (3, 5, 7, 15, 20 °C/min).')
  print(entities)
  tree = oscar.parse("A solution of 124C (7.0 g, 32.4 mmol) in concentrate H2SO4 " +
	            "(9.5 mL) was added to a solution of concentrate H2SO4 (9.5 mL) " +
	            "and fuming HNO3 (13 mL) and the mixture was heated at 60°C for " +
	            "30 min. After cooling to room temperature, the reaction mixture " +
	            "was added to iced 6M solution of NaOH (150 mL) and neutralized " +
	            "to pH 6 with 1N NaOH solution. The reaction mixture was extracted " +
	            "with dichloromethane (4x100 mL). The combined organic phases were " +
	            "dried over Na2SO4, filtered and concentrated to give 124D as a solid.")
  print(tree)
