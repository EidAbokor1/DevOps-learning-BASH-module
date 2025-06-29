# 🐚 Bash Scripting Notes

## 📌 1. Shebang

```bash
#!/bin/bash
```
What: Tells the system to use Bash to run the script.

When: Always place this at the top of every Bash script.

Why: Ensures consistent behavior across environments.

## ✍️ 2. Writing and Running Scripts

```bash
chmod +x script.sh   # Make script executable
./script.sh          # Run the script
```

When: After creating a .sh file.

Why: chmod +x gives permission to execute the file.

## 💬 3. Comments

```bash
# This is a comment
```

When: Anytime you want to explain your code.

Why: Improves readability and helps future you (and others).

## 🧠 4. Variables

```bash
name="Alice"
echo "Hello, $name"
```

When: You need to store data like strings, numbers, or filenames.

Why: Makes your scripts reusable and dynamic.

## 🔢 5. Arithmetic

```bash
a=5
b=3
echo $((a + b))     # Output: 8
```

When: You need to do math in your script.

Why: Enables calculations without external tools.

## 📥 6. User Input

```bash
read -p "Enter your name: " username
echo "Hello, $username"
```

When: You want your script to interact with the user.

Why: Makes scripts more dynamic and customizable.

## 🧾 7. If Statements

```bash
if [ "$x" -gt 10 ]; then
  echo "x is greater than 10"
fi
```

When: You need to make decisions based on conditions.

Why: Controls what part of the script runs.

## 🔁 8. If...Elif...Else

```bash
if [ "$x" -lt 0 ]; then
  echo "Negative"
elif [ "$x" -eq 0 ]; then
  echo "Zero"
else
  echo "Positive"
fi
```

When: You have multiple separate conditions.

Why: Lets you choose between multiple execution paths.

## 🔄 9. Nested If

```bash
if [ "$x" -gt 0 ]; then
  if [ "$x" -lt 10 ]; then
    echo "x is between 1 and 9"
  fi
fi
```

When: One condition depends on another.

Why: For more precise and layered logic.

## 🧭 10. Case Statement

```bash
read -p "Enter a number (1-3): " num

case $num in
  1)
    echo "You selected one"
    ;;
  2)
    echo "You selected two"
    ;;
  3)
    echo "You selected three"
    ;;
  *)
    echo "Invalid option"
    ;;
esac
```

When: You have multiple fixed choices to compare.

Why: Cleaner than using multiple if-elif blocks.

## 🗃️ 11. Arrays

```bash
fruits=("apple" "banana" "cherry")

echo "${fruits[0]}"       # Output: apple
echo "${fruits[@]}"       # Output: apple banana cherry
echo "${#fruits[@]}"      # Output: 3

# Loop through array
for fruit in "${fruits[@]}"; do
  echo "$fruit"
done
```

When: You want to store a list of items.

Why: Makes it easy to manage multiple values in one variable.


## 🔃 12. For Loops

```bash
for i in 1 2 3; do
  echo "Number $i"
done
```

When: You need to repeat code a fixed number of times.

Why: Automates repetitive tasks.

## 🔁 13. While Loops

```bash
count=1
while [ $count -le 5 ]; do
  echo "Count is $count"
  ((count++))
done
```

When: You want to repeat something while a condition is true.

Why: Great for unknown or variable repetitions.

## 🧩 14. Functions

```bash
greet() {
  echo "Hello, $1"
}

greet "Alice"
```

When: You want to reuse code in different places.

Why: Helps keep your scripts organized and DRY (Don't Repeat Yourself).

## 🛑 15. break

```bash
count=1
while [ $count -le 5 ]; do
  if [ $count -eq 3 ]; then
    break
  fi
  echo "Count is $count"
  ((count++))
done

```

When: You want to stop a loop early when a certain condition is met.

Why: Useful for exiting loops when continuing no longer makes sense (e.g., found a result, hit an error).

## ⏭️ 16. continue

```bash
count=0
while [ $count -lt 5 ]; do
  ((count++))
  if [ $count -eq 3 ]; then
    continue
  fi
  echo "Count is $count"
done
```

When: You want to skip part of a loop when a condition is met, but keep looping.

Why: Helps you avoid unnecessary work or special-case logic inside loops.

## ⏭️ 17. Error Handling

```bash
set -e  # Exit immediately on any error

echo "Creating a directory..."
mkdir /restricted_area  # Will fail if you don't have permission

echo "This will not run if the above command fails."
```

When: You want your script to stop immediately when a command fails instead of continuing blindly.

Why: Without error handling, your script may continue and do unexpected or dangerous things after a failure.

| Feature  | Description                                                                      |
| -------- | -------------------------------------------------------------------------------- |
| `$?`     | Stores the **exit status** of the last command (`0` = success, non-zero = error) |
| `set -e` | **Exit script on first error**                                                   |
| `set -u` | Error on **undefined variables**                                                 |
| `trap`   | Run **custom code on exit/error/interrupt**                                      |


## ⏭️ 18. Exit Code ($? and exit)

```bash
echo "Checking file..."
if [ -f "/etc/passwd" ]; then
  echo "File exists"
  exit 0
else
  echo " File not found"
  exit 1
fi
```

When: You want your script or a command to communicate success or failure using a numeric code.

Why: Exit codes help:

Detect if a script or command ran successfully

Allow other scripts or tools (like CI/CD pipelines) to respond correctly

| Code     | Meaning                                |
| -------- | -------------------------------------- |
| `0`      | Success                                |
| `1+`     | Some kind of error                     |
| `$?`     | Exit status of last cmd                |
| `exit N` | Manually set exit code (e.g. `exit 2`) |


## ⏭️ 19. set Commands (-e, -u, -x, -o)

```bash
set -euo pipefail
# or use individually: set -e, set -u, set -x

echo "Running command..."
cp /nonexistent/file /tmp/
echo "This will not run because of set -e"

```

When: You want to make your Bash scripts safer, more robust, and easier to debug.

Why: The set command changes how Bash behaves — helpful for error handling, debugging, and safety in scripts.

| Flag          | Description                                                           |
| ------------- | --------------------------------------------------------------------- |
| `-e`          | Exit immediately if **any command fails**                             |
| `-u`          | Exit if you use **undefined variables**                               |
| `-x`          | **Print every command** before running (great for **debugging**)      |
| `-o pipefail` | Causes pipeline to fail if **any part** fails (not just the last one) |
