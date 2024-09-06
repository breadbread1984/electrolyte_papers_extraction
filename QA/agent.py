#!/usr/bin/python3

from langchain.memory import ConversationBufferMemory
from langchain.agents import AgentExecutor, load_tools
from langchain.agents.format_scratchpad import format_log_to_str
from langchain.agents.output_parsers import ReActJsonSingleInputOutputParser
from models import Llama3, Qwen2
from prompts import agent_template
from tools import load_knowledge_graph
import config

class Agent(object):
  def __init__(self, model = 'llama3', tools = ['google-serper', 'llm-math', 'wikipedia', 'arxiv']):
    llms_types = {
      'llama3': Llama3,
      'qwen2': Qwen2
    }
    tokenizer, llm = llms_types[model](True)
    kg_tool = load_knowledge_graph(host = config.neo4j_host, username = config.neo4j_user, password = config.neo4j_pass, database = config.neo4j_db, tokenizer = tokenizer, llm = llm)
    tools = load_tools(tools, llm = llm, serper_api_key = 'd075ad1b698043747f232ec1f00f18ee0e7e8663') + \
      [kg_tool,]
    prompt = agent_template(tokenizer, tools)
    llm = llm.bind(stop = ["<|eot_id|>"])
    chain = {"input": lambda x: x["input"], "agent_scratchpad": lambda x: format_log_to_str(x["intermediate_steps"])} | prompt | llm | ReActJsonSingleInputOutputParser()
    memory = ConversationBufferMemory(memory_key="chat_history")
    self.agent_chain = AgentExecutor(agent = chain, tools = tools, memory = memory, verbose = True)
  def query(self, question):
    return self.agent_chain.invoke({"input": question})

if __name__ == "__main__":
  agent = Agent(model = 'llama3')
  print(agent.query("please give the range of ionic conductivity of electrolyte Li6PS5Cl"))
