#!/bin/bash

# Function to send email
send_email() {
    local subject="$1"
    local body="$2"
    python3 - <<EOF
import smtplib
from email.mime.text import MIMEText

# SMTP Configuration
SMTP_HOST = 'smtp.gmail.com'
SMTP_PORT = 587
SMTP_USER = 'abc@gmail.com'
SMTP_PASS = 'password'

# Email details
EMAIL_FROM = SMTP_USER
EMAIL_TO = 'abc@example.com'

def send_email(subject, body):
    msg = MIMEText(body)
    msg['Subject'] = subject
    msg['From'] = EMAIL_FROM
    msg['To'] = EMAIL_TO

    try:
        with smtplib.SMTP(SMTP_HOST, SMTP_PORT) as server:
            server.starttls()
            server.login(SMTP_USER, SMTP_PASS)
            server.sendmail(EMAIL_FROM, EMAIL_TO, msg.as_string())
        print(f"Email sent: {subject}")
    except Exception as e:
        print(f"Failed to send email: {e}")

send_email("$subject", """$body""")
EOF
}

# Client and project details
CLIENTNAME="ABC"
PROJECTNAME="ProjectBackup"

# Set the date format for the backup file name
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# MySQL credentials
MYSQL_USER="user"
MYSQL_PASSWORD="password"
MYSQL_DATABASE="db_name"

# Backup directory (use an absolute path for reliability)
BACKUP_DIR="/backup"

# Ensure the backup directory exists
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    if [ $? -ne 0 ]; then
        send_email "$CLIENTNAME - $PROJECTNAME: MySQL Backup Failed" "Failed to create backup directory: $BACKUP_DIR"
        exit 1
    fi
fi

# Create backup using mysqldump
BACKUP_FILE="$BACKUP_DIR/mysql_backup_$DATE.sql"
mysqldump -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE > $BACKUP_FILE
if [ $? -eq 0 ]; then
    # Get database size
    DB_SIZE=$(du -sh $BACKUP_FILE | cut -f1)

    # Get CPU and RAM usage
    CPU_USAGE=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4 "%"}')
    RAM_USAGE=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')

    # Backup successful, send success email
    send_email "$CLIENTNAME - $PROJECTNAME: MySQL Backup Successful - $DB_SIZE" \
    "Backup Details:
    - Date: $DATE
    - Database Size: $DB_SIZE
    - CPU Usage During Backup: $CPU_USAGE
    - RAM Usage During Backup: $RAM_USAGE"
else
    # Backup failed, send failure email
    send_email "$CLIENTNAME - $PROJECTNAME: MySQL Backup Failed" \
"MySQL backup failed on $DATE. Please check the server for issues."
    exit 1
fi

# Remove backups older than 7 days
find $BACKUP_DIR -type f -name "mysql_backup_*.sql" -mtime +7 -exec rm -f {} \;

# Log cleanup action (detailed)
BACKUP_COUNT=$(ls $BACKUP_DIR/mysql_backup_*.sql 2>/dev/null | wc -l)
echo "$DATE: Backup process completed successfully."
echo "$DATE: Current backups in $BACKUP_DIR: $BACKUP_COUNT files."
echo "$DATE: Old backups older than 7 days have been cleaned up from $BACKUP_DIR."
if [ $BACKUP_COUNT -eq 0 ]; then
    echo "$DATE: Warning! No backups are currently present in $BACKUP_DIR."
else
    echo "$DATE: Backups are available in $BACKUP_DIR."
fi
