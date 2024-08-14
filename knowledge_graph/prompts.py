#!/usr/bin/python3

from langchain_core.pydantic_v1 import BaseModel, Field, create_model
from langchain_core.output_parsers import JsonOutputParser
from langchain_core.prompts.prompt import PromptTemplate

def extract_triplets_template(tokenizer, node_labels = None, rel_types = None):
  base_string_parts = [
        "You are a top-tier algorithm designed for extracting information in "
        "structured formats to build a knowledge graph. Your task is to identify "
        "the entities and relations requested with the user prompt from a given "
        "text. You must generate the output in a JSON format containing a list "
        'with JSON objects. Each object should have the keys: "head", '
        '"head_type", "relation", "tail", and "tail_type". The "head" '
        "key must contain the text of the extracted entity with one of the types "
        "from the provided list in the user prompt.",
        f'The "head_type" key must contain the type of the extracted head entity, '
        f"which must be one of the types from %s." % str(node_labels)
        if node_labels
        else "",
        f'The "relation" key must contain the type of relation between the "head" '
        f'and the "tail", which must be one of the relations from %s.' % str(rel_types)
        if rel_types
        else "",
        f'The "tail" key must represent the text of an extracted entity which is '
        f'the tail of the relation, and the "tail_type" key must contain the type '
        f"of the tail entity from %s." % str(node_labels)
        if node_labels
        else "",
        "Attempt to extract as many entities and relations as you can. Maintain "
        "Entity Consistency: When extracting entities, it's vital to ensure "
        'consistency. If an entity, such as "John Doe", is mentioned multiple '
        "times in the text but is referred to by different names or pronouns "
        '(e.g., "Joe", "he"), always use the most complete identifier for '
        "that entity. The knowledge graph should be coherent and easily "
        "understandable, so maintaining consistency in entity references is "
        "crucial.",
        "IMPORTANT NOTES:\n- Don't add any explanation and text.",
  ]
  system_prompt = "\n".join(filter(None, base_string_parts))
  class UnstructuredRelation(BaseModel):
    head: str = Field(
        description=(
            "extracted head entity like Microsoft, Apple, John. "
            "Must use human-readable unique identifier."
        )
    )
    head_type: str = Field(
        description="type of the extracted head entity like Person, Company, etc"
    )
    relation: str = Field(description="relation between the head and the tail entities")
    tail: str = Field(
        description=(
            "extracted tail entity like Microsoft, Apple, John. "
            "Must use human-readable unique identifier."
        )
    )
    tail_type: str = Field(
        description="type of the extracted tail entity like Person, Company, etc"
    )
  parser = JsonOutputParser(pydantic_object = UnstructuredRelation)
  examples = [
    {
        "text": (
            "Adam is a software engineer in Microsoft since 2009, "
            "and last year he got an award as the Best Talent"
        ),
        "head": "Adam",
        "head_type": "Person",
        "relation": "WORKS_FOR",
        "tail": "Microsoft",
        "tail_type": "Company",
    },
    {
        "text": (
            "Adam is a software engineer in Microsoft since 2009, "
            "and last year he got an award as the Best Talent"
        ),
        "head": "Adam",
        "head_type": "Person",
        "relation": "HAS_AWARD",
        "tail": "Best Talent",
        "tail_type": "Award",
    },
    {
        "text": (
            "Microsoft is a tech company that provide "
            "several products such as Microsoft Word"
        ),
        "head": "Microsoft Word",
        "head_type": "Product",
        "relation": "PRODUCED_BY",
        "tail": "Microsoft",
        "tail_type": "Company",
    },
    {
        "text": "Microsoft Word is a lightweight app that accessible offline",
        "head": "Microsoft Word",
        "head_type": "Product",
        "relation": "HAS_CHARACTERISTIC",
        "tail": "lightweight app",
        "tail_type": "Characteristic",
    },
    {
        "text": "Microsoft Word is a lightweight app that accessible offline",
        "head": "Microsoft Word",
        "head_type": "Product",
        "relation": "HAS_CHARACTERISTIC",
        "tail": "accessible offline",
        "tail_type": "Characteristic",
    },
  ]
  # escape {} to avoid being taken as input variables
  instructions = parser.get_format_instructions()
  instructions = instructions.replace('{','{{')
  instructions = instructions.replace('}','}}')
  examples = str(examples).replace('{','{{')
  examples = examples.replace('}','}}')
  human_prompt = """Based on the following example, extract entities and 
relations from the provided text.\n\n
Use the following entity types, don't use other entity that is not defined below:
# ENTITY TYPES:
%s

Use the following relation types, don't use other relation that is not defined below:
# RELATION TYPES:
%s

Below are a number of examples of text and their extracted entities and relationships.
%s

For the following text, extract entities and relations as in the provided example.
%s\nText: {input}""" % (str(node_labels), str(rel_types), examples, instructions)
  messages = [
    {'role': 'system', 'content': system_prompt},
    {'role': 'user', 'content': human_prompt}
  ]
  prompt = tokenizer.apply_chat_template(messages, tokenize = False, add_generation_prompt = True)
  template = PromptTemplate(template = prompt, input_variables = ['input'])
  return template, parser

def cypher_generation_template(tokenizer, neo4j, entity_types):
  schema = neo4j.get_schema
  schema = schema.replace('{','{{')
  schema = schema.replace('}','}}')
  cypher_template = ["Based on the Neo4j graph schema below, write a Cypher query that would answer the user's question:",
"%s" % schema,
"Entities in the question map to the following database values:",
"%s" % str(entity_types),
"Question: {question}",
"Cypher query:"]
  cypher_template = '\n'.join(cypher_template)
  messages = [
    {'role': 'system', 'content': 'Given an input question, convert it to a Cypher query. No pre-amble.'},
    {'role': 'user', 'content': cypher_template}
  ]
  prompt = tokenizer.apply_chat_template(messages, tokenize = False, add_generation_prompt = True)
  template = PromptTemplate(template = prompt, input_variables = ['question'])
  return template

def entity_generation_template(tokenizer, entity_types):
  entity_template = "Extract entities of type among %s from the user given question. Focus on extracting the entities that we can use to best lookup answers to the question. Provide entities sorted by their types in the following format: {'type1': [entity1, entity2], 'type2': [], 'type3': ['entity3']}. Reply no extra words besides entities." % str(entity_types)
  entity_template = entity_template.replace('{','{{')
  entity_template = entity_template.replace('}','}}')
  messages = [
    {'role': 'system', 'content': entity_template},
    {'role': 'user', 'content': "{question}"}
  ]
  prompt = tokenizer.apply_chat_template(messages, tokenize = False, add_generation_prompt = True)
  template = PromptTemplate(template = prompt, input_variables = ['question'])
  return template

def triplets_qa_template(tokenizer, triplets):
  qa_template = "Base only on triplets extracted from knowledge graph as fact, please reply user's question. If the triplets gives no clue to the question, just answer 'I can't answer your question.'. Triplets: %s" % str(triplets)
  qa_template = qa_template.replace('{','{{')
  qa_template = qa_template.replace('}','}}')
  messages = [
    {'role': 'system', 'content': qa_template},
    {'role': 'user', 'content': "{question}"}
  ]
  prompt = tokenizer.apply_chat_template(messages, tokenize = False, add_generation_prompt = True)
  template = PromptTemplate(template = prompt, input_variables = ['question'])
  return template

if __name__ == "__main__":
  from huggingface_hub import login
  from transformers import AutoTokenizer
  login(token = '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')
  tokenizer = AutoTokenizer.from_pretrained('meta-llama/Meta-Llama-3-8B-Instruct')
  template, parser = extract_triplets_template(tokenizer, node_labels = ['node1', 'node2', 'node3'], rel_types = ['rel1', 'rel2', 'rel3'])
  print(template.format_prompt(input = 'test').to_string())
