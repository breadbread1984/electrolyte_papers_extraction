#!/usr/bin/python3

from langchain_core.prompts.prompt import PromptTemplate

def summarize_template(tokenizer, additional_instructions = None, accumulated = False):
  messages = [
    {'role': 'system', 'content': 'Rewrite this text in summarized form.' + ("" if additional_instructions is None else f"\n\n{additional_instructions}")},
    {'role': 'user', 'content': "{chunk}" if accumulated == False else "Previous summaries:\n\n{accumulated_summaries_string}\n\n{chunk}"}
  ]
  prompt = tokenizer.apply_chat_template(messages, tokenize = False, add_generating_prompt = True)
  template = PromptTemplate(template = prompt, input_variables = ['chunk'] if accumulated == False else ['chunk', 'accumulated_summaries_string'])
  return template

def relevant_template(tokenizer):
  messages = [
    {'role': 'system', 'content': 'given a text, please identify wether the text is relevant to sulfide eletrolyte. answer only yes or no.'},
    {'role': 'user', 'content': '{text}'}
  ]
  prompt = tokenizer.apply_chat_template(messages, tokenize = False, add_generating_prompt = True)
  template = PromptTemplate(template = prompt, input_variables = ['text'])
  return template
