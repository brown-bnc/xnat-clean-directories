FROM ubuntu:latest

# Clean logs files older than 30 days
CMD  /usr/bin/find /data/xnat/home/logs -name '*.log.*' -mtime +20 && /usr/bin/find /home/xnat/cache -mtime +20 
  