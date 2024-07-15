#!/usr/bin/python3

from prompts import stuff_prompt

def stuff_chain(tokenizer, llm):
  chain = stuff_prompt(tokenizer) | llm
  return chain

