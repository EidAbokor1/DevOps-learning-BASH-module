#!/bin/bash

# Mission: Create a script that backs up a directory to a specified location and keeps only the last 5 backups.

source_dir="$1"
backup_dir="$2"
timestamp=$(date +%Y%m%d_%H%M%S)
backup_name="backup_$timestamp.tar.gz"

if [ -z "$source_dir" ] || [ -z "$backup_dir" ]; then
    echo "Usage: $0 /path/to/source /path/to/backup"
    exit 1
fi

mkdir -p "$backup_dir"

tar -czf "$backup_dir/$backup_name" "$source_dir"

echo "Backup created: $backup_dir/$backup_name"

cd "$backup_dir" || exit
ls -t backup_*.tar.gz | tail -n +6 | xargs -r rm --

echo "Old backups cleaned up. Kept last 5."