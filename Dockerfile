ARG UBUNTU_VERSION=22.04
FROM python:3.13-alpine
ENV PARENT_PATH=/data/xnat
ENV DAYS_TO_CLEAN=100


COPY entrypoint.sh /entrypoint.sh

COPY cleanup_cache.sh /cleanup_cache.sh
COPY clean_logs.sh /clean_logs.sh
COPY clean_main.sh /clean_main.sh
COPY send_notification.py /send_notification.py
COPY find_stale_prearchive.sh /find_stale_prearchive.sh

RUN chmod +x /cleanup_cache.sh
RUN chmod +x /clean_logs.sh
RUN chmod +x /clean_main.sh
RUN chmod +x /entrypoint.sh
RUN chmod +x /find_stale_prearchive.sh 

CMD ["/entrypoint.sh"]  

    
