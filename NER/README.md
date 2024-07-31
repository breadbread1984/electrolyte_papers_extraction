# Named Entity Recognization

This project is to train a model to do named entity recognization.

# Usage

## Install prerequisite packages

```shell
python3 -m pip install -r requirements.txt
sudo apt install yarnpkg
```

## Preprocess documents for annotation

```shell
python3 preprocess.py --input_dir <path/to/pdf> [--output_dir <path/to/preprocessed/docs>] [--length <sentence/length>]
```

## Annotation for SpaCy

- copy and paste the sentences you want to annotate to a file one at a line.
- download annotator at [this repo](https://github.com/tecoholic/ner-annotator).
- run yarnpkg && yarnpkg serve and visit http://localhost:8081/ner-annotator/
- open the preprocessed file and finish annotation
- save the annotation to a json file

## Convert annotation for SpaCy to that of AdaSeq

```shell
bash convert.sh <path/to/spacy/annotation/file> output
cat output/*.jsonl trainset.jsonl
```

## Train Bert+CRF model

```shell
adaseq train -c task.yaml
```

after training, find the **latest checkpoint** under ckpt/ner/. edit <path/to/latest/checkpoint>/output_best/configuration.json to change the following lines

from

```json
    "plugins": [
        "adaseq"
    ]

```

to

```json
    "plugins": [
        "https://files.pythonhosted.org/packages/49/47/ddf684253dbb4c3e0716fcda67094aa3c407237d5eb8930ede0a91b9feb8/adaseq-0.6.6-py3-none-any.whl"
    ]
```
