#!/bin/bash

FOLDER="$PARENT_PATH/prearchive"

# files older than 1 day
files=($(find "$FOLDER" -type f -mtime +0))

python3 send_notification.py "${files[@]}"