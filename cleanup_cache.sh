#!/bin/bash

usage=$(df --output=pcent $PARENT_PATH/cache/ | awk 'NR==2 {gsub("%",""); print $1}') # Get the usage of the cache folder

if [ $usage -gt 75 ]; then
        DAYS_TO_CLEAN=$((DAYS_TO_CLEAN / usage))
fi

/usr/bin/find $PARENT_PATH/cache -mindepth 1 -type f -mtime +$DAYS_TO_CLEAN  -delete
