#!/bin/bash

# Mission: Write a script that accepts a filename as an argument and prints the number of lines in that file. If no filename is provided, display a message saying 'No file provided'.

filename="$1"

if [ -z $filename ]; then
    echo "No file provided"
else
    wc -l "$filename"
fi
