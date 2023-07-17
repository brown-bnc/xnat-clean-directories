FROM ubuntu:latest

CMD  /usr/bin/find /data/xnat/home/logs -name '*.log.*' -mtime +20 