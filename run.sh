#!/bin/bash

log() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") - $1"
}

log "Checking if .env file exists..."
if [ ! -f .env ]; then
    log "Error: .env file not found."
    exit 1
fi

log "Exporting all variables in the .env file..."
set -a
source .env
set +a

log "Checking if LIVE_NOTEBOOK is set..."
if [ -z "$LIVE_NOTEBOOK" ]; then
    log "Error: LIVE_NOTEBOOK environment variable is not set."
    exit 1
fi

log "Environment variables loaded successfully. LIVE_NOTEBOOK is set to $LIVE_NOTEBOOK."

log "Building container image..."
docker build -t live-notebook .

log "Running container..."
docker run -p 8080:8080 -v ./$LIVE_NOTEBOOK:/app/$LIVE_NOTEBOOK.ipynb -v ./web:/app/web -d live-notebook