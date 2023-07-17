FROM ubuntu:latest

# Clean logs files older than 30 days
RUN  /usr/bin/find /data/xnat/home/logs -name '*.log.*' -mtime +20 

# Clean cache files older than 30 days
RUN  /usr/bin/find /home/xnat/cache -mtime +20 -delete