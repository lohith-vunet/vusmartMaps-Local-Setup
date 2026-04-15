#!/bin/bash

# Define the command to execute with JSON files as arguments

# Define the directory containing the subdirectories
MAIN_DIR="/home/vunet/workspace/cairo/deployment/fixtures"

# Loop through each subdirectory
for DIR in "${MAIN_DIR}"/*; do
    if [ -d "${DIR}" ]; then
        echo "Processing directory: ${DIR}"

        ls "${DIR}"/* | while read line; do django-admin manage_resources import --file "${line}"; done


    fi
done

