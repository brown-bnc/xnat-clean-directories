ARG UBUNTU_VERSION=22.04
FROM ubuntu:$UBUNTU_VERSION
ENV PARENT_PATH=/data/xnat
ENV DAYS_TO_CLEAN=100

COPY cleanup_cache.sh /cleanup_cache.sh
RUN chmod +x /cleanup_cache.sh

CMD /usr/bin/find $PARENT_PATH/home/logs -mindepth 1 -type f -name '*.log.*' -mtime +$DAYS_TO_CLEAN -delete && \
    /usr/bin/find $PARENT_PATH/prearchive -mindepth 1 -type f -mtime +$DAYS_TO_CLEAN -delete && \
    /usr/bin/find $PARENT_PATH/archive -mindepth 1 -type f -mtime +$DAYS_TO_CLEAN -delete && \
    /usr/bin/find $PARENT_PATH/build -mindepth 1 -type f -mtime +$DAYS_TO_CLEAN -delete && \
    /usr/bin/find $PARENT_PATH/inbox -mindepth 1 -type f -mtime +$DAYS_TO_CLEAN -delete && \
    /cleanup_cache.sh
