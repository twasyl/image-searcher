#!/bin/bash

# Run the docker image and ensure it finds offensive words
OUT=$(docker run --rm -v ./tests/resources:/work $1)
if [[ $OUT != *master* ]]; then
    echo "No offensive words have been found while expected!"
    exit 1
fi