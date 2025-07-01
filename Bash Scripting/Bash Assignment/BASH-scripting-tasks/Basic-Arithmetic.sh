#!/bin/bash 

# Basic Arithmetic: 
# Write a script that takes two numbers as input from the user and performs basic arithmetic operations (addition, subtraction, multiplication, and division) and then displays all the answers of those operations in the terminal. 

read -p "Input 1st Number: " num1
read -p "Input 2nd Number: " num2


addition=$(($num1 + $num2))
subtraction=$(($num1 - $num2))
multiplication=$(($num1 * $num2))
division=$(($num1 / $num2))

echo "(($num1 + $num2 = $addition))"
echo "(($num1 - $num2 = $subtraction))"
echo "(($num1 * $num2 = $multiplication))"
echo "(($num1 / $num2 = $division))"