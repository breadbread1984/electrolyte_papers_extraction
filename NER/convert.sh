#!/bin/bash

for f in "$1"/*.txt
do
    bn="$(basename $f .txt)"
    python3 create_dataset.py --input "$f" --output "$bn".jsonl
done
