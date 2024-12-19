
#!/bin/bash

# Server Administration Script
# Author: Rahul Chauhan
# Purpose: Automates common server administration tasks

# Function to display a banner
function show_banner() {
    echo "=============================================="
    echo "     LINUX SERVER ADMINISTRATION TOOL         "
    echo "=============================================="
}

# Function to check disk space
function check_disk_space() {
    echo "[INFO] Checking disk space..."
    df -h | grep '^/dev/'
    echo ""
}

# Function to monitor system load
function monitor_system_load() {
    echo "[INFO] Monitoring system load..."
    uptime
    echo ""
}

# Function to check running services
function check_services() {
    echo "[INFO] Checking critical services..."
    for service in sshd nginx mysql; do
        if systemctl is-active --quiet $service; then
            echo "[OK] $service is running"
        else
            echo "[ALERT] $service is NOT running"
        fi
    done
    echo ""
}

# Function to create a backup
function create_backup() {
    BACKUP_DIR="/var/backups"
    TIMESTAMP=$(date +"%Y%m%d%H%M%S")
    BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

    echo "[INFO] Creating backup of /etc and /var/www..."
    mkdir -p $BACKUP_DIR
    tar -czf $BACKUP_FILE /etc /var/www 2>/dev/null

    if [ $? -eq 0 ]; then
        echo "[SUCCESS] Backup created: $BACKUP_FILE"
    else
        echo "[ERROR] Backup failed!"
    fi
    echo ""
}

# Function to display system info
function system_info() {
    echo "[INFO] Displaying system information..."
    echo "Hostname: $(hostname)"
    echo "Operating System: $(cat /etc/os-release | grep -w NAME | cut -d= -f2)"
    echo "Kernel Version: $(uname -r)"
    echo "Total RAM: $(free -h | grep Mem | awk '{print $2}')"
    echo "CPU Info: $(lscpu | grep 'Model name' | awk -F: '{print $2}')"
    echo ""
}

# Main Menu
function main_menu() {
    while true; do
        show_banner
        echo "1. Check Disk Space"
        echo "2. Monitor System Load"
        echo "3. Check Running Services"
        echo "4. Create Backup"
        echo "5. Display System Info"
        echo "6. Exit"
        echo "=============================================="
        read -p "Enter your choice: " choice

        case $choice in
            1) check_disk_space ;;
            2) monitor_system_load ;;
            3) check_services ;;
            4) create_backup ;;
            5) system_info ;;
            6) echo "[INFO] Exiting..."; break ;;
            *) echo "[ERROR] Invalid choice, try again!";;
        esac
    done
}

# Execute main menu
main_menu
