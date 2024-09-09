#!/usr/bin/python3

from typing import Optional, Type, List, Dict, Union, Any
from neo4j import GraphDatabase, BoltDriver
from transformers import AutoTokenizer, PreTrainedTokenizerFast, CodeLlamaTokenizer
from langchain.llms.base import LLM
from langchain.pydantic_v1 import BaseModel, Field
from langchain.tools import BaseTool, StructuredTool, Tool, tool
from langchain.callbacks.manager import AsyncCallbackManagerForToolRun, CallbackManagerForToolRun

def load_knowledge_graph(host = "bolt://localhost:7687", username = "neo4j", password = "neo4j", database = "neo4j", tokenizer = None, llm = None):
  class Input(BaseModel):
    query: str = Field(description = "electrolyte in chemical formula format")
  class Config(BaseModel):
    class Config:
      arbitrary_types_allowed = True
    neo4j: BoltDriver
    db: str
    tokenizer: Union[PreTrainedTokenizerFast, CodeLlamaTokenizer]
    llm: LLM
  class Tool(BaseTool):
    name = "electrolyte property query tool"
    description = "You can query ionic conductivity, energy density, current density or structure of an electrolyte with this tool. the tool returns a dictionary whose key is the type of attribute and the corresponding value is a specific value of the attribute. this tool may yield multiple values for one attribute. They are corresponding to values of the attribute in different conditions."
    args_schema: Type[BaseModel] = Input
    return_direct: bool = True
    config: Config
    def _run(self, query: str, run_manager: Optional[CallbackManagerForToolRun] = None) -> str:
      records, summary, keys = self.config.neo4j.execute_query("match (a: SULFIDE_ELECTROLYTE)-[r]->(b) where a.name = $f return b as attribute", f = query, database_ = self.config.db)
      attributes = dict()
      for record in records:
        if list(record['attribute'].labels)[0] not in attributes:
          attributes[list(record['attribute'].labels)[0]] = list()
        attributes[list(record['attribute'].labels)[0]].append(record['attribute']['value'])
      res = list()
      for attribute, values in attributes.items():
        res.append('属性%s存在属性值%s' % (attribute.replace('_',' ').lower(), ', '.join(values)))
      return '; '.join(res)
    async def _arun(self, query: str, run_manager: Optional[AsyncCallbackManagerForToolRun] = None) -> str:
      raise NotImplementedError("electrolyte property query tool does not support async!")
  neo4j = GraphDatabase.driver(host, auth = (username, password))
  return Tool(config = Config(neo4j = neo4j, db = database, tokenizer = tokenizer, llm = llm))

if __name__ == "__main__":
  from models import Qwen2
  tokenizer, llm = Qwen2(True)
  kg = load_knowledge_graph(password = "19841124", database = 'triplet', tokenizer = tokenizer, llm = llm)
  res = kg.invoke("Li6PS5Cl")
  print(res)

