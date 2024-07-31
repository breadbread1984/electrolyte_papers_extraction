# Introduction

this project is to identify whether the papers are relevant to sulfide electrolyte.

# Usage

## Install prerequisite

```shell
python3 -m pip install -r requirements.txt
sudo apt install poppler-utils tesseract-ocr
```

## Run the program

identity with LLM

```shell
python3 main.py --input_dir <path/to/directory> [--locally]
```

identity with keyword presenting

```shell
python3 simple_filter.py --input_dir <path/to/directory>
```
