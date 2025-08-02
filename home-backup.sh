#!/bin/bash

SOURCE_DIR="$HOME/"
BACKUP_DIR="/tmp/backup"
LOG_FILE="/var/log/home-backup.log"

mkdir -p "$BACKUP_DIR"

echo "[$(date +'%Y-%m-%d %H:%M:%S')] Backup has started..." >> "$LOG_FILE"

rsync -a --delete --checksum "$SOURCE_DIR" "$BACKUP_DIR" >> "$LOG_FILE" 2>&1

if [ $? -eq 0 ]; then
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] Backup successful" >> "$LOG_FILE"
else
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] ERROR. Check logfile /var/log/" >> "$LOG_FILE"
fi
