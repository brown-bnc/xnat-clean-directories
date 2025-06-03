#!/bin/sh
FOLDER="$PARENT_PATH/prearchive"

# files older than 1 day
mapfile -t files < <(find "$FOLDER" -type f -mtime +0 -exec dirname {} \; | sort -u | grep -v '^$' | xargs -r  -d '\n' du -sh 2>/dev/null)

python3 send_notification.py "${files[@]}"