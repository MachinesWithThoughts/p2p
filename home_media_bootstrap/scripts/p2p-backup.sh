#!/bin/bash
# Backup script for NAS3 p2p share

SOURCE="/mnt/p2p/config"
DEST="/mnt/p2p/backup/configs"
LOG="/mnt/p2p/backup/logs/backup_$(date +'%Y-%m-%d').log"

mkdir -p "$DEST" "$(dirname "$LOG")"

echo "==== Starting backup: $(date) ====" >> "$LOG"

rsync -avh --delete "$SOURCE"/ "$DEST"/ >> "$LOG" 2>&1
rsync -avh --delete /mnt/p2p/apps/sonarr/ "$DEST"/sonarr-data/ >> "$LOG" 2>&1
rsync -avh --delete /mnt/p2p/apps/sabnzbd/ "$DEST"/sabnzbd-data/ >> "$LOG" 2>&1

echo "==== Backup complete: $(date) ====" >> "$LOG"
