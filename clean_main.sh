#!/bin/sh

set -e

# running scripts in parallel
/clean_logs.sh &
/cleanup_cache.sh &

wait 
