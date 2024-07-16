#!/usr/bin/python3

from os import environ
from torch import device
from huggingface_hub import login
from transformers import AutoTokenizer, AutoModelForCausalLM
from langchain.llms.base import LLM
from langchain_community.llms import HuggingFaceEndpoint
from langchain_community.llms.huggingface_pipeline import HuggingFacePipeline
from langchain_openai import ChatOpenAI

class Mamba(LLM):
  tokenizer: AutoTokenizer = None
  model: AutoModelForCausalLM = None
  def __init__(self, dev = 'cuda'):
    assert dev in {'cpu', 'cuda'}
    super().__init__()
    self.tokenizer = AutoTokenizer.from_pretrained('state-spaces/mamba-2.8b-hf', trust_remote_code = True)
    self.model = AutoModelForCausalLM.from_pretrained('state-spaces/mamba-2.8b-hf', trust_remote_code = True)
    self.model = self.model.to(device(dev))
    self.model.eval()
  def _call(self, prompt, stop = None, run_manager = None, **kwargs):
    input_ids = self.tokenizer(prompt, return_tensors = "pt")['input_ids']
    input_ids = input_ids.to(self.model.device)
    out = self.model.generate(input_ids, do_sample = False, temperature = 0.8, top_p = 0.8)
    out = out[len(input_ids):]
    return out
  @property
  def _llm_type(self):
    return "mamba-2.8b-hf"

