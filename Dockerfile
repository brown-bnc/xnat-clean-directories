ARG UBUNTU_VERSION=22.04
FROM ubuntu:$UBUNTU_VERSION
ENV PARENT_PATH=/data/xnat
ENV DAYS_TO_CLEAN=100

#install python
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

COPY cleanup_cache.sh /cleanup_cache.sh
COPY clean_logs.sh /clean_logs.sh
COPY clean_main.sh /clean_main.sh
COPY send_notification.py /send_notification.py
COPY find_older_files.sh /find_older_files.sh

RUN chmod +x /cleanup_cache.sh
RUN chmod +x /clean_logs.sh
RUN chmod +x /clean_main.sh
RUN chmod +x /entrypoint.sh
RUN chmod +x /find_older_files.sh 

CMD ["/entrypoint.sh"]  

    
