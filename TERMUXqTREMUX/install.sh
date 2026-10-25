#!/data/data/com.termux/files/usr/bin/bash

BACKUP_URL="https://raw.githubusercontent.com/clevjhon/TERMUXqTREMUX/main/termuxDB.bin"
DEST_FILE="/sdcard/termuxDB.bin"

echo "Downloading backup database..."
curl -L "$BACKUP_URL" -o "$DEST_FILE"

echo "Restoring files directly..."
cd ~
tar -zxvf "$DEST_FILE"
echo "Restoration complete!"

