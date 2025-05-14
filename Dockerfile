ARG UBUNTU_VERSION=22.04
FROM ubuntu:$UBUNTU_VERSION
ENV PARENT_PATH=/data/xnat
ENV DAYS_TO_CLEAN=100

COPY cleanup_cache.sh /cleanup_cache.sh
COPY clean_logs.sh /clean_logs.sh
COPY clean_main.sh /clean_main.sh

RUN chmod +x /cleanup_cache.sh
RUN chmod +x /clean_logs.sh
RUN chmod +x /clean_main.sh

CMD ["/clean_main.sh"]

    
