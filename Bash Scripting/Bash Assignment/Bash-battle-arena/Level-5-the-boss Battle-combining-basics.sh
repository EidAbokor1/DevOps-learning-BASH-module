#!/bin/bash

# Mission: Combine what you've learned! Write a script that:
# 1. Creates a directory names 'Battlefield'
# 2. Inside Battlefield, create files named knight.txt, sorcerer.txt, and rogue.txt.
# 3. Check if knight.txt exists; if it does, move it to a new directory called Archive.
# 4. List the contents of both Battlefield and Archive.

mkdir -p Battlefield
mkdir -p Archive

touch Battlefield/knight.txt Battlefield/sorcerer.txt Battlefield/rogue.txt

echo ""

if [ -f "Battlefield/knight.txt" ];  then
    echo "knight.txt exists moving to Archive..."
    mv Battlefield/knight.txt Archive
    echo "Moved knight.txt to Archive"
else
    echo "knight.txt doesn't exists, need to create knight.txt"
fi

echo ""

echo "Content of Battlefield: "
ls Battlefield/

echo ""

echo "Content of Archive: "
ls Archive/
