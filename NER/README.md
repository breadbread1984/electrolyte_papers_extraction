# Named Entity Recognization

This project is to train a model to do named entity recognization.

# Usage

## Install prerequisite packages

```shell
python3 -m pip install -r requirements.txt
sudo apt install yarnpkg
```

## Annotation for SpaCy

- copy and paste the sentences you want to annotate to a file one at a line.
- download annotator at [this repo](https://github.com/tecoholic/ner-annotator).
- run yarnpkg && yarnpkg serve and visit http://localhost:8081/ner-annotator/
- open the file you prepared and finish annotation
- save the annotation to a json file

## Convert annotation for SpaCy to that of AdaSeq

```shell
python3 create_dataset.py --input <path/to/spacy/annotation/file> --output <path/to/adaseq/annotation/file>
```

## Train Bert+CRF model

```shell
adaseq train -c task.yaml
```

