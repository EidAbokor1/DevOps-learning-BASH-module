#!/bin/bash

# Mission: Create a script that checks the disk space usage of a specified directory and sends an alert if the usage exceeds a given threshold.

directory="$1"
threshold="$2"

if [ -z "$directory" ] || [ -z "$threshold" ]; then
  echo "Usage: $0 /path/to/directory threshold%"
  exit 1
fi

usage=$(df -h "$directory" | awk 'NR==2 {gsub("%", "", $5); print $5}')

if [ "$usage" -ge "$threshold" ]; then
  echo "ALERT: Disk usage for $directory is at ${usage}% (threshold: ${threshold}%)"
else
  echo "Disk usage for $directory is ${usage}%, below threshold (${threshold}%)."
fi