#!/bin/bash -e

BACKUP_PATH="/opt/backups/mongodb"
BACKUP_DATE=$(date +"%d-%m-%Y")
DB_NAME="graylog"

docker exec mongodb mongodump --db "$DB_NAME" --gzip --archive > "$BACKUP_PATH"/mongodb_dump_"$BACKUP_DATE".gz