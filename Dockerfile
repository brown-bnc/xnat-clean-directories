FROM ubuntu:latest

# Clean logs files older than 30 days
CMD  /usr/bin/find /data/xnat/home/logs -name '*.log.*' -mtime +20 -delete \ 
     && /usr/bin/find /data/xnat/cache -mtime +20 -delete \
     && /usr/bin/find /data/xnat/build -mtime +20 -delete