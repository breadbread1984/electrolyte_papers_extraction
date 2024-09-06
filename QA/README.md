# Introduction

this project provides a QA system to handling query about electrolytes

# Usage

## Install prerequisite packages

```shell
python3 -m pip install -r requirements.txt
```

## Load triplets from NER

```shell
bash ../NER/run_cypher.sh ../NER/triplet_output.cypher
```

## Run the service

```shell
python3 main.py --model (llama3|qwen2)
```

