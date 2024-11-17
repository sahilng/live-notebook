#!/bin/bash

log() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") - $1"
}

log "Checking if .env file exists..."
if [ -f .env ]; then
    log "Exporting all variables in the .env file..."
    set -a
    source .env
    set +a
fi

log "Checking if LIVE_NOTEBOOK is set..."
if [ -z "$LIVE_NOTEBOOK" ]; then
    log "Error: LIVE_NOTEBOOK environment variable is not set."
    exit 1
fi

log "Environment variables loaded successfully. LIVE_NOTEBOOK is set to $LIVE_NOTEBOOK."

log "Building container image..."
docker build -t live-notebook .

log "Running container..."
docker run -p 8080:8080 -e LIVE_NOTEBOOK=$LIVE_NOTEBOOK -v ./requirements.txt:/app/requirements.txt -v ./$LIVE_NOTEBOOK:/app/$LIVE_NOTEBOOK.ipynb -d live-notebook