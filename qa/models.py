#!/usr/bin/python3

from os import environ
import torch
from torch import device
from huggingface_hub import login
from transformers import AutoTokenizer, AutoModelForCausalLM, LogitsProcessorList, \
                TemperatureLogitsWarper, TopKLogitsWarper, TopPLogitsWarper
from langchain.llms.base import LLM

def Llama3(locally = False):
  assert locally == True, "must be locally!"
  class LLama3FA2(LLM):
    tokenizer: AutoTokenizer = None
    model: AutoModelForCausalLM = None
    def __init__(self,):
      super().__init__()
      self.tokenizer = AutoTokenizer.from_pretrained('meta-llama/Meta-Llama-3.1-8B-Instruct', trust_remote_code = True)
      self.tokenizer.pad_token_id = 128001
      self.model = AutoModelForCausalLM.from_pretrained('meta-llama/Meta-Llama-3.1-8B-Instruct', attn_implementation = 'flash_attention_2', torch_dtype = torch.float16, trust_remote_code = True)
      self.model = self.model.to(device('cuda'))
      self.model.eval()
    def _call(self, prompt, stop = None, run_manager = None, **kwargs):
      logits_processor = LogitsProcessorList()
      logits_processor.append(TemperatureLogitsWarper(0.6))
      logits_processor.append(TopPLogitsWarper(0.9))
      inputs = self.tokenizer(prompt, return_tensors = 'pt')
      inputs = inputs.to(device('cuda'))
      outputs = self.model.generate(**inputs, logits_processor = logits_processor, use_cache = True, do_sample = True, max_length = 131072)
      outputs = outputs.tolist()[0][len(inputs["input_ids"][0]):-1]
      response = self.tokenizer.decode(outputs)
      return response
    @property
    def _llm_type(self):
      return "llama3.1 with flast attention 2"
  llm = LLama3FA2()
  return llm.tokenizer, llm

def Qwen2(locally = False):
  assert locally == True, "must be locally!"
  class Qwen2FA2(LLM):
    tokenizer: AutoTokenizer = None
    model: AutoModelForCausalLM = None
    def __init__(self,):
      super().__init__()
      self.tokenizer = AutoTokenizer.from_pretrained('Qwen/Qwen2-7B-Instruct', trust_remote_code = True)
      self.model = AutoModelForCausalLM.from_pretrained('Qwen/Qwen2-7B-Instruct', attn_implementation = 'flash_attention_2', torch_dtype = torch.float16, trust_remote_code = True)
      self.model = self.model.to(device('cuda'))
      self.model.eval()
    def _call(self, prompt, stop = None, run_manager = None, **kwargs):
      logits_processor = LogitsProcessorList()
      logits_processor.append(TemperatureLogitsWarper(0.8))
      logits_processor.append(TopPLogitsWarper(0.8))
      inputs = self.tokenizer(prompt, return_tensors = 'pt')
      inputs = inputs.to(device('cuda'))
      outputs = self.model.generate(**inputs, logits_processor = logits_processor, use_cache = True, do_sample = True, max_length = 131072)
      outputs = outputs.tolist()[0][len(inputs["input_ids"][0]):-1]
      response = self.tokenizer.decode(outputs)
      return response
    @property
    def _llm_type(self):
      return "qwen2 with flast attention 2"
  llm = Qwen2FA2()
  return llm.tokenizer, llm

