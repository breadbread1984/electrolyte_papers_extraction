# Introduction

this project is to provide a tool to extract knowledge graph from patent materials

# Usage

## Install prerequisite

```shell
python3 -m pip install -r requirements.txt
```
## Fix issues of langchain-experimental

edit line 551 of **<path/to/site-packages>/langchain_experimental/graph_transformers/llm.py** to change the code from

```python
except NotImplementedError:
```

to

```python
except:
```

edit line 595 of **<path/to/site-packages>/langchain_experimental/graph_transformers/llm.py** to change the code from

```python
parsed_json = self.json_repair.loads(raw_schema.content)
```

to

```python
parsed_json = self.json_repair.loads(raw_schema)
```

edit line 597 of **<path/to/site-packages>/langchain_experimental/graph_transformers/llm.py** to change the code from

```python
for rel in parsed_json:
    # Nodes need to be deduplicated using a set
    nodes_set.add((rel["head"], rel["head_type"]))
    nodes_set.add((rel["tail"], rel["tail_type"]))
```

to

```python
for rel in parsed_json:
    invalid = False
    if type(rel) is not dict: invalid = True
    elif "head" not in rel or "head_type" not in rel: invalid = True
    elif "tail" not in rel or "tail_type" not in rel: invalid = True
    elif rel["head"] is None or rel["head_type"] is None: invalid = True
    elif rel["tail"] is None or rel["tail_type"] is None: invalid = True
    if invalid:
        print('invalid json: %s' % raw_schema)
        continue
    # Nodes need to be deduplicated using a set 
    nodes_set.add((rel["head"], rel["head_type"]))
    nodes_set.add((rel["tail"], rel["tail_type"]))
```

edit line 149 of **<path/to/site-package>/langchain_experimental/sql/base.py** to change the code from

```python
result = self.database.run(sql_cmd)
```

to
```python
import re
pattern = r"```sql(.*)```"
match = re.search(pattern, sql_cmd, re.DOTALL)
if match is None:
  pattern = r"```(.*)```"
  match = re.search(pattern, sql_cmd, re.DOTALL)
sql_cmd = match[1] if match is not None else sql_cmd
result = self.database.run(sql_cmd)
```

## Extract Knowledge Graph

```shell
python3 main.py --model (llama3|qwen2) --input_dir <path/to/directory/of/patents> [--host <host>] [--user <user>] [--password <password>] [--database <database>] [--locally]
```

