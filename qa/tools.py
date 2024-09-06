#!/usr/bin/python3

from typing import Optional, Type, List, Dict, Union, Any
from neo4j import GraphDatabase
from transformers import AutoTokenizer, PreTrainedTokenizerFast, CodeLlamaTokenizer
from langchain.llms.base import LLM
from langchain.pydantic_v1 import BaseModel, Field
from langchain.tools import BaseTool, StructuredTool, Tool, tool
from langchain.callbacks.manager import AsyncCallbackManagerForToolRun, CallbackManagerForToolRun

def load_knowledge_graph(host = "bolt://localhost:7687", username = "neo4j", password = "neo4j", database = "neo4j", tokenizer = None, llm = None):
  class Input(BaseModel):
    query: str = Field(description = "question about attributes of electrolyte")
  class Config(BaseModel):
    class Config:
      arbitrary_types_allowed = True
    neo4j: GraphDatabase
    tokenizer: Union[PreTrainedTokenizerFast, CodeLlamaTokenizer]
    llm: LLM
  class Tool(BaseTool):
    name = "electrolyte property query tool"
    description = "you can find ionic conductivity, energy density, current density and crystal structure of an electrolyte with this tool"
    args_schema: Type[BaseModel] = Input
    return_direct: boll = True
    config: Config
    def _run(self, query: str, run_manager: Optional[CallbackManagerForToolRun] = None) -> str
