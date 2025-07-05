#!/bin/bash

# Mission: Write a script that:
# 1. Creates a directory called Arena_Boss.
# 2. Creates 5 text files inside the directory, named file1.txt to file5.txt.
# 3. Generates a random number of lines (between 10 and 20) in each file.
# 4. Sorts these files by their size and displays the list.
# 5. Checks if any of the files contain the word 'Victory', and if found, moves the file to a directory called Victory_Archive.

mkdir "Arena_Boss"
touch Arena_Boss/file{1..5}.txt

for file in Arena_Boss/*.txt; do
    line=$(( RANDOM % 11 + 10 ))
    seq 1 $line > "$file"
done

du -b Arena_Boss/*.txt | sort -n

mkdir Victory_Archive

for file in Arena_Boss/*.txt; do
  if grep -q "Victory" "$file"; then
    mv "$file" Victory_Archive/
  fi
done