#!/bin/bash

# Mission: Combine the skills you've gained! Write a script that:

# 1. Presents a menu to the user with the following options:

# - Check disk space
# - Show system uptime
# - Backup the Arena directory and keep the last 3 backups
# - Parse a configuration file settings.conf and display the values

# 2. Execute the chosen task.

BACKUP_DIR="./arena_backups"
ARENA_DIR="./Arena"
CONFIG_FILE="settings.conf"

mkdir -p "$BACKUP_DIR"

show_menu() {
    echo "=============================="
    echo "DevOps Menu"
    echo "=============================="
    echo "1. Check disk space"
    echo "2. Show system uptime"
    echo "3. Backup Arena directory (keep last 3 backups)"
    echo "4. Parse settings.conf"
    echo "5. Exit"
    echo "------------------------------"
    read -p "Choose an option [1-5]: " choice
}

backup_arena() {
    timestamp=$(date +"%Y%m%d_%H%M%S")
    backup_name="arena_backup_$timestamp.tar.gz"

    if [ -d "$ARENA_DIR" ]; then
        tar -czf "$BACKUP_DIR/$backup_name" "$ARENA_DIR"
        echo "Backup created: $backup_name"
    else
        echo "Arena directory not found!"
        return
    fi

    # Keep only last 3 backups
    cd "$BACKUP_DIR" || return
    ls -t | grep 'arena_backup_' | tail -n +4 | xargs -r rm --
    cd - > /dev/null
}

parse_config() {
    if [ ! -f "$CONFIG_FILE" ]; then
        echo "Configuration file not found: $CONFIG_FILE"
        return
    fi

    echo "Config values:"
    while IFS='=' read -r key value; do
        [[ $key =~ ^#.*$ || -z $key ]] && continue  
        echo "$key = $value"
    done < "$CONFIG_FILE"
}

# Menu Loop
while true; do
    show_menu
    case $choice in
        1)
            echo "Disk Space:"
            df -h
            ;;
        2)
            echo "System Uptime:"
            uptime
            ;;
        3)
            backup_arena
            ;;
        4)
            parse_config
            ;;
        5)
            echo "Goodbye!"
            break
            ;;
        *)
            echo "Invalid option. Please choose 1-5."
            ;;
    esac
    echo ""
done