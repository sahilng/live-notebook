#!/bin/bash

# Create the output directory if it doesn't exist
mkdir -p web

# Initial conversion of the notebook to HTML
python -m jupyter nbconvert live.ipynb \
    --to html \
    --execute \
    --output index.html \
    --output-dir ./web \
    --template web-template

# Start the web server in the background
python -m http.server 8080 --directory /app/web &

# Loop to rerun the conversion every 60 seconds
while true
do
    sleep 60
    python -m jupyter nbconvert live.ipynb \
        --to html \
        --execute \
        --output index.html \
        --output-dir ./web \
        --template web-template
done
