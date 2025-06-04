#!/bin/bash

# List of directories to clean (relative to $PARENT_PATH)
DIRS_TO_CLEAN=(
  "home/logs"
  "prearchive"
  "build"
  "inbox"
)

echo "Logging contents of $PARENT_PATH/prearchive before clean"
echo "=== Prearchive folder listing at $(date) ==="
find "$PARENT_PATH/prearchive" -mindepth 1 -maxdepth 1 -type d 

echo "=== Cleaning started at $(date) ==="
echo "Parent path: $PARENT_PATH"
echo "Days to clean: $DAYS_TO_CLEAN"

for rel_path in "${DIRS_TO_CLEAN[@]}"; do
  full_path="$PARENT_PATH/${rel_path}"
  
  # DONT DELETE /data/xnat/archives
  if [[ "$full_path" == "/data/xnat/archive" || \
        "$full_path" == "data/xnat/archive" ]]; then
    continue
  fi

  if [[ "$rel_path" == "home/logs" ]]; then
    # Cleaning logs
    echo "Cleaning old log files in: $full_path"
    find "$full_path" -mindepth 1 -type f -name '*.log.*' -mtime +"$DAYS_TO_CLEAN" -delete
  else
    # Cleaning old files
    echo "Cleaning old files in: $full_path"
    find "$full_path" -mindepth 1 -type f -mtime +"$DAYS_TO_CLEAN" -delete
  fi
done
echo "=== Cleaning finished at $(date) ==="