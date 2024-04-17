#!/bin/bash

counter=0
df -h /$PARENT_PATH | while IFS= read -r line; do
        ((counter++))
        if [ $counter -eq 2 ]; then
                usage=$(echo "$line" | awk '{print $5}')
                usage=${usage%\%}
                DAYS_TO_CLEAN=$((DAYS_TO_CLEAN / usage))
        fi
done

/usr/bin/find $PARENT_PATH/home/logs -type f -name '*.log.*' -mtime +$DAYS_TO_CLEAN -delete
/usr/bin/find $PARENT_PATH/cache -type f -mtime +$DAYS_TO_CLEAN  -delete
/usr/bin/find $PARENT_PATH/build -type f -mtime +$DAYS_TO_CLEAN -delete