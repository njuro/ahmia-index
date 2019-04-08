#!/bin/bash

# If the environment file does not exist, create it based on example.env
if [ ! -f .env ]; then
    echo "Warning: File .env not found, copying from example.env"
    cp example.env .env
fi

# Parse the environment variables from .env file, ignoring the comments
export $(cat .env | grep -v ^# | xargs)

curl -XPUT -i "${ES_URL}tor/" -H 'Content-Type: application/json' -d "@./mappings_tor.json"
curl -XPUT -i "${ES_URL}i2p/" -H 'Content-Type: application/json' -d "@./mappings_i2p.json"