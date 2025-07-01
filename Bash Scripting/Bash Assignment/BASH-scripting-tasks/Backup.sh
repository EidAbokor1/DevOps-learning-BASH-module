#!/bin/bash

# Backup Script: 
# Create a script that copies all .txt files from a specified directory to a backup directory. If the backup directory doesn’t exist, the script should create it first. 

DIR=$1
Backup=$2


if [ ! -d "$Backup" ]; then
    echo "Creating directory $Backup..."
    mkdir -p "$Backup"
else
    echo "Directory $Backup already exists."
fi

cp "$DIR/*.txt $Backup"