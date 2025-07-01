#!/bin/bash

# Conditional Statements:
# Write a script that checks if a file exists and prints a message indicating whether it exists or not. If it exists, the script should also check if the file is readable, writable, or executable

FILE=$1

if [ -f "$FILE" ]; then
    echo "This file exists: $FILE"
    ls -l "$FILE"

    if [ -r "$FILE" ]; then
        echo "The file is readable."
    else
        echo "The file is NOT readable."
    fi

    if [ -w "$FILE" ]; then
        echo "The file is writable."
    else
        echo "The file is NOT writable."
    fi

    if [ -x "$FILE" ]; then
        echo "The file is executable."
    else
        echo "The file is NOT executable."
    fi
else
    echo "This file doesn't exist: $FILE"
fi