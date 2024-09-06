#!/usr/bin/python3

from langchain import hub
from langchain_core.prompts.prompt import PromptTemplate

def agent_template(tokenizer, tools):
  prompt = hub.pull('hwchase17/react-json')
  system_template = prompt[0].prompt.template
  system_template = system_template.replace('{tools}', render_text_description(tools))
  system_template = system_template.replace('{tool_names}', ", ".join([t.name for t in tools]))
  user_template = prompt[1].prompt.template
  messages = [
    {'role': 'system', 'content': system_template},
    {'role': 'user', 'content': user_template}
  ]
  prompt = tokenizer.apply_chat_template(messages, tokenize = False, add_generation_prompt = True)
  template = PromptTemplate(template = prompt, input_variables = ['agent_scratchpad', 'input'])
  return template
