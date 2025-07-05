#!/bin/bash

# Mission: Create a script that searches for a specific word or phrase across all .log files in a directory and outputs the names of the files that contain the word or phrase.

phrase=$1

if [ -z "$phrase" ]; then
    echo "Please provide a search phrase."
    exit 1
else
    grep -l "$phrase" ./*.log 2>/dev/null
fi