#!/bin/bash

# Mission: Create an interactive script that presents a menu with options for different system tasks (e.g., check disk space, show system uptime, list users), and executes the chosen task.

while true; do
    echo "=============================="
    echo "🛠️  System Tasks Menu"
    echo "=============================="
    echo "1. Check disk space"
    echo "2. Show system uptime"
    echo "3. List users"
    echo "4. Exit"
    echo "------------------------------"
    read -p "Choose an option [1-4]: " choice

    case $choice in
        1)
            echo "📦 Disk space:"
            df -h
            ;;
        2)
            echo "⏳ System uptime:"
            uptime
            ;;
        3)
            echo "👥 Logged-in users:"
            who
            ;;
        4)
            echo "Goodbye!"
            break
            ;;
        *)
            echo "❌ Invalid choice. Please select 1-4."
            ;;
    esac

    echo
done