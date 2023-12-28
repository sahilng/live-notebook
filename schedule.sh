#!/bin/bash

# Path to the script you want to run
SCRIPT="./run_and_publish.sh"

# Infinite loop
while true; do
  # Run your script
  "$SCRIPT"

  # Wait for 60 seconds
  sleep 60
done