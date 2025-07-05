#!/bin/bash

# Mission: Write a script that sorts all .txt files in a directory by their size, from smallest to largest, and displays the sorted list.

shopt -s nullglob
file=(*.txt)

if [ ${#file[@]} -eq 0 ]; then
    echo "No.txt files found."
    exit 1
else
    du -b "${files[@]}" | sort -n
fi