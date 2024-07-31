#!/usr/bin/python3

from os.path import abspath
from modelscope.pipelines import pipeline
from modelscope.utils.constant import Tasks

class NER(object):
  def __init__(self, ckpt, device = 'gpu'):
    assert device in {'gpu', 'cpu'}
    self.pipeline = pipeline(Tasks.named_entity_recognition, abspath(ckpt), device = device)
  def process(self, text):
    results = self.pipeline(text)
