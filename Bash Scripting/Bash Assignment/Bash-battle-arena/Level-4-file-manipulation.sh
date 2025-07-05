#!/bin/bash

# Mission: Create a script that copies all .txt files from the Arena directory to a new directory called Backup.

mkdir -p Arena
mkdir -p Backup

cp Arena/*.txt Backup