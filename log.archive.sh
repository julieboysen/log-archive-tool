#!/bin/bash

# Check if log directory is passed as an argument
if [ -z "$1" ]
  then
    echo "No argument supplied"
    exit 1
fi

LOG_DIR=$1
ARCHIVE_DIR="archives"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_FILE="logs_archive_$TIMESTAMP.tar.gz"
LOG_FILE="archives/archive_log.txt"
DAYS_TO_KEEP_LOGS=7
DAYS_TO_KEEP_BACKUPS=30

# Check if the log directory exists
if [ ! -d "$LOG_DIR" ]; then
  echo "Log directory $LOG_DIR does not exist."
  exit 1
fi

# Create the archive directory if it doesn't exist
if [ ! -d "$ARCHIVE_DIR" ]; then
  mkdir "$ARCHIVE_DIR"
fi

# Compress the logs into a .tar.gz file
find "$LOG_DIR" -type f -mtime +$DAYS_TO_KEEP_LOGS -print0 | tar -czvf "$ARCHIVE_DIR/$ARCHIVE_FILE" --null -T -

# Log the archiving process
echo "Logs archived in $ARCHIVE_FILE on $(date)" >> "$ARCHIVE_DIR/archive_log.txt"

# Delete logs older than the specified number of days
find "$LOG_DIR" -type f -mtime +$DAYS_TO_KEEP_LOGS -exec rm -f {} \;

echo "Archiving completed: $ARCHIVE_FILE"

# Delete backup archives older than specified days
find "$ARCHIVE_DIR" -type f -name "*.tar.gz" -mtime +$DAYS_TO_KEEP_BACKUPS -exec rm -f {} \;
echo "Backup archives older than $DAYS_TO_KEEP_BACKUPS days have been deleted."