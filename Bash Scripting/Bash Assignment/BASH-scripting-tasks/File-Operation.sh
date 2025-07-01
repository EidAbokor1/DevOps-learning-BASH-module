#!/bin/bash

# File Operations:
# Write a script that creates a directory, navigates into it, creates a file inside it, writes some text to the file, and then displays the contents of the file. 

mkdir test
cd test
touch test.txt
cat << EOF > test.txt
This is testing some text
EOF
cat test.txt