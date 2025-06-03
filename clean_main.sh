#!/bin/bash

set -e

# running scripts in parallel
/clean_logs.sh &
/cleanup_cache.sh &

wait 
