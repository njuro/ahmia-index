#!/bin/bash

### 0. Parse settings ###

# If the environment file does not exist, create it based on example.env
if [ ! -f .env ]; then
    echo "Warning: File .env not found, copying from example.env"
    cp example.env .env
fi
# Parse the environment variables from .env file, ignoring the comments
export $(cat .env | grep -v ^# | xargs)


### Problem 1: ###
# sometimes, e.g during re-indexing, or low disk space, indices are switched to read-only, undo it
# tor
curl -XPUT "${ES_URL}tor/_settings" --data '{"index": {"blocks": {"read_only": "false"}}}' -H 'Content-Type: application/json'
curl -XPUT "${ES_URL}tor/_settings" --data '{"index": {"blocks": {"read_only_allow_delete": "false"}}}' -H 'Content-Type: application/json'
# i2p
curl -XPUT "${ES_URL}i2p/_settings" --data '{"index": {"blocks": {"read_only": "false"}}}' -H 'Content-Type: application/json'
curl -XPUT "${ES_URL}i2p/_settings" --data '{"index": {"blocks": {"read_only_allow_delete": "false"}}}' -H 'Content-Type: application/json'