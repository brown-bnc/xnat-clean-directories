#!/bin/bash

counter=0
df -h /$PARENT_PATH/cache | while IFS= read -r line; do
        ((counter++))
        if [ $counter -eq 2 ]; then
                usage=$(echo "$line" | awk '{print $5}')
                usage=${usage%\%}
                if [ $usage -gt 75]; then
                    DAYS_TO_CLEAN=$((DAYS_TO_CLEAN / usage))
                fi
        fi
done

/usr/bin/find $PARENT_PATH/home/logs -mindepth 1 -type f -name '*.log.*' -mtime +$DAYS_TO_CLEAN -delete
/usr/bin/find $PARENT_PATH/cache -mindepth 1 -type f -mtime +$DAYS_TO_CLEAN  -delete
/usr/bin/find $PARENT_PATH/build -mindepth 1 -type f -mtime +$DAYS_TO_CLEAN -delete