#!/bin/bash

NOTEBOOK_DIR="./"
NOTEBOOK_FILE="example.ipynb"
OUTPUT_FILE="index.html"
OUTPUT_DIR=web
TEMPLATE=web-template

python -m jupyter nbconvert $NOTEBOOK_FILE --to html --execute --output $OUTPUT_FILE --output-dir $OUTPUT_DIR --template $TEMPLATE