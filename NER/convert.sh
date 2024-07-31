#!/bin/bash

rm -rf "$2"
mkdir "$2"
for f in "$1"/*.json
do
    bn="$(basename $f .json)"
    python3 create_dataset.py --input "$f" --output "$2"/"$bn".jsonl
done
