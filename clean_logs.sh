#!/bin/bash

# List of directories to clean (relative to $PARENT_PATH)
DIRS_TO_CLEAN=(
  "home/logs"
  "prearchive"
  "build"
  "inbox"
)

for rel_path in "${DIRS_TO_CLEAN[@]}"; do
  full_path="$PARENT_PATH/${rel_path}"
  
  # DONT DELETE /data/xnat/archives
  if [[ "$rel_path" == "archives" || "$full_path" == "/data/xnat/archives" ]]; then
    continue
  fi

  if [[ "$rel_path" == "home/logs" ]]; then
    # Cleaning logs
    find "$full_path" -mindepth 1 -type f -name '*.log.*' -mtime +"$DAYS_TO_CLEAN" -delete
  else
    # Cleaning old files
    find "$full_path" -mindepth 1 -type f -mtime +"$DAYS_TO_CLEAN" -delete
  fi
done
