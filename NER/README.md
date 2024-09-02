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
cat output/*.jsonl > <path/to/dataset.jsonl>
```

convert adaseq format dataset to huggingface format dataset

```shell
python3 adaseq_to_hf.py --input <path/to/dataset.jsonl> --output <path/to/output.json>
```

## Train model

### Train Bert+CRF with Adaseq

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

| model | pretrained checkpoint |
|-------|-----------------------|
| BERT+CRF | https://drive.google.com/file/d/1Z0ucLNfV-yF3zwWtbZvhDzai-ImDAUYn/view?usp=sharing |

### Train Bert with Huggingface

```shell
python3 train_huggingface_ner.py --model_name_or_path google-bert/bert-base-cased --train_file <path/to/trainset.json> --validation_file <path/to/valset.json> --output_dir <path/to/ckpt> --do_train --do_eval --overwrite_output_dir --num_train_epochs 10
```

| model | pretrained checkpoint |
|-------|-----------------------|
| Bert  | https://drive.google.com/file/d/1Psi-88vf4vF3gAFNcKjl8CzRnbcEDEQM/view?usp=sharing |

## Test model

### Test Bert+CRF with Adaseq

```shell
adaseq test -ckpt ckpt/ner/<checkpoint>/best_model -w ckpt/ner/<checkpoint>
```

### Test Bert with HuggingFace

```shell
python3 train_huggingface_ner.py --model_name_or_path google-bert/bert-base-cased --validation_file <path/to/valset.json> --output_dir <path/to/ckpt> --do_eval --overwrite_output_dir
```

## Extract entities from papers

```shell
python3 extract_entities.py --input_dir <path/to/directory/of/pdfs> [--output <path/to/output/directory>] --ckpt <ckpt> --framework (huggingface|adaseq) [--device (cpu|cuda)]
```

## Visualize extracted entities in Neo4j

```shell
python3 create_value_web.py --input_dir <path/to/directory/of/jsons>
bash run_cypher.sh
```

