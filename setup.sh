#!/bin/bash

echo "Installing requirements..."
pip install -r requirements.txt
sudo apt update
sudo apt install screen -y

echo "Starting server..."
screen -S server -d -m ./serve.sh

echo "Starting runner..."
screen -S runner -d -m ./schedule.sh

echo "Finished setup!"