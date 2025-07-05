#!/bin/bash

# Mission: Write a script that monitors a directory for any changes (file creation, modification, or deletion) and logs the changes with a timestamp.

directory=$1

if [ -z "$directory" ]; then
    echo "Usage: $0 directory"
    exit 1
fi

inotifywait -m "$DIR" | while read event; do
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $event"
done

