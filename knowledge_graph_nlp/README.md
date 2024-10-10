# Introduction

this project extract entity and relationship from chemical literatures

# Usage

## Install prerequisite packages

```shell
sudo apt install default-jre libapache-opennlp-java antlr4 python3-jpype python3-urllib3
python3 -m pip install -r requirements.txt
```

## extract experimental steps

```shell
python3 main.py --input_dir <path/to/literatures/in/markdown/format> --output_dir <output/path> --method (oscar|corenlp|opennlp)
```
