# Introduction

this project is to provide a tool to extract knowledge graph from patent materials

# Usage

## install neo4j

download jar of apoc from [official github](https://github.com/neo4j/apoc/releases/tag/5.19.0)

download jar of neosemantics from [official github](https://github.com/neo4j-labs/neosemantics/releases)

install neo4j with the following commands

```shell
wget -O - https://debian.neo4j.com/neotechnology.gpg.key | sudo apt-key add -
echo 'deb https://debian.neo4j.com stable latest' | sudo tee /etc/apt/sources.list.d/neo4j.list
sudo apt update
sudo apt install daemon cypher-shell neo4j
sudo cp <path/to/downloaded/apoc/jar> /var/lib/neo4j/plugins
sudo cp <path/to/downloaded/neosemantics/jar> /var/lib/neo4j/plugins
sudo echo "dbms.directories.plugins=/var/lib/neo4j/plugins" >> /etc/neo4j/neo4j.conf
sudo echo "dbms.security.procedures.unrestricted=algo.*,apoc.*" >> /etc/neo4j/neo4j.conf
sudo echo "dbms.unmanaged_extension_classes=n10s.endpoint=/rdf" >> /etc/neo4j/neo4j.conf
sudo echo "server.default_listen_address=0.0.0.0" >> /etc/neo4j/neo4j.conf
sudo echo "apoc.export.file.enabled=true" >> /etc/neo4j/apoc.conf
sudo echo "apoc.import.file.enabled=true" >> /etc/neo4j/apoc.conf
sudo systemctl start neo4j
sudo systemctl status neo4j
```

start the neo4j desktop by executing **neo4j** in console.

add a new dbms and add a database.

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
    if type(rel) is not dict: continue
    elif "head" not in rel or "head_type" not in rel: continue
    elif "tail" not in rel or "tail_type" not in rel: continue
    elif rel["head"] is None or rel["head_type"] is None or rel['head_type'] == '': continue
    elif rel["tail"] is None or rel["tail_type"] is None or rel['tail_type'] == '': continue
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

## Export the database in cypher format

```shell
bash run_cypher.sh > output.cypher
```

the exported all.cypher file is under **/var/lib/neo4j/import/**
