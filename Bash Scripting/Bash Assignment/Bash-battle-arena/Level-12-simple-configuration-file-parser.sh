#!/bin/bash

# Mission: Write a script that reads a configuration file in the format KEY=VALUE and prints each key-value pair.

read -p "Configuration file: " file

if [ ! -f "$file" ]; then
    echo "File not found!"
    exit 1
fi

while IFS='=' read -r key value; do
    [[ -z "$key" || "$key" == \#* ]] && continue
    echo "Key: $key | Value: $value"
done < "$file"
