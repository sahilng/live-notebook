#!/bin/bash

log() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") - $1"
}

log "Checking if LIVE_NOTEBOOK is set..."
if [ -z "$LIVE_NOTEBOOK" ]; then
    log "Error: LIVE_NOTEBOOK environment variable is not set."
    exit 1
fi

log "Environment variables loaded successfully. LIVE_NOTEBOOK is set to $LIVE_NOTEBOOK."

log "Creating the output directory if it doesn't exist..."
mkdir -p web

log "Installing notebook dependencies..."
pip install --root-user-action=ignore -r requirements.txt

log "Running initial conversion of the notebook to HTML"
python -m jupyter nbconvert "$LIVE_NOTEBOOK" \
    --to html \
    --execute \
    --output index.html \
    --output-dir ./web \
    --template web-template

log "Starting the web server in the background..."
python -m http.server 8080 --directory /app/web &

log "Looping to rerun the conversion every 60 seconds..."
while true
do
    sleep 60
    log "Installing any new notebook dependencies..."
    pip install --root-user-action=ignore -r requirements.txt --quiet
    python -m jupyter nbconvert "$LIVE_NOTEBOOK" \
        --to html \
        --execute \
        --output index.html \
        --output-dir ./web \
        --template web-template
    log "Refreshed notebook"
done