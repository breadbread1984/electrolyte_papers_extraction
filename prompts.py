#!/usr/bin/python3

from langchain_core.pydantic_v1 import BaseModel, Field, create_model
from langchain_core.output_parsers import JsonOutputParser
from langchain_core.prompts.prompt import PromptTemplate
from langchain.output_parsers.regex import RegexParser

def stuff_prompt(tokenizer):
  messages = [
    {"role": "system", "content": """Use the following pieces of context to answer the user's question. 
If you don't know the answer, just say that you don't know, don't try to make up an answer.
----------------
{context}"""},
    {"role": "user", "content": "{question}"}
  ]
  prompt = tokenizer.apply_chat_template(messages, tokenize = False, add_generating_prompt = True)
  template = PromptTemplate(template = prompt, input_variables = ["context", "question"])
  return template

