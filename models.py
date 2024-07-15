#!/usr/bin/python3

from os import environ
from huggingface_hub import login
from transformers import AutoTokenizer
from langchain_community.llms import HuggingFaceEndpoint
from langchain_community.llms.huggingface_pipeline import HuggingFacePipeline
from langchain_openai import ChatOpenAI

def Mamba(locally = False):
  login('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')
  tokenizer = AutoTokenizer.from_pretrained('state-spaces/mamba-2.8b-hf', trust_remote_code = True)
  if locally:
    llm = HuggingFacePipeline.from_model_id(
      model_id = "state-spaces/mamba-2.8b-hf",
      task = "text-generation",
      device = 0,
      pipeline_kwargs = {
        "do_sample": False,
        "top_p": 0.8,
        "temperature": 0.8,
        "return_full_text": False
      })
  else:
    environ['HUGGINGFACEHUB_API_TOKEN'] = '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'
    llm = HuggingFaceEndpoint(
      endpoint_url = "state-spaces/mamba-2.8b-hf",
      task = "text-generation",
      do_sample = False,
      top_p = 0.8,
      temperature = 0.8,
    )
  return tokenizer, llm

