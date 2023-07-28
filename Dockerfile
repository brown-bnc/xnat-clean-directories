
ARG UBUNTU_VERSION=22.04
FROM ubuntu:$UBUNTU_VERSION
ENV PARENT_PATH=/data/xnat
ENV DAYS_TO_CLEAN=60

# Clean logs files older than $DAYS_TO_CLEAN days
#CMD touch $PARENT_PATH/home/logs/kmilo_test4.txt && touch $PARENT_PATH/home/logs/kmilo_test5.txt &&  touch $PARENT_PATH/home/logs/kmilo_test6.txt \
# && ls -ls $PARENT_PATH/home/logs | grep kmilo && echo "------------"  \
# && /usr/bin/find $PARENT_PATH/home/logs -type f -name 'kmilo*.txt' -delete 
CMD ls -ls $PARENT_PATH/home/logs && \
    ls -ls $PARENT_PATH/cache \
    ls -ls $PARENT_PATH/build 
#CMD  /usr/bin/find $PARENT_PATH/home/logs -type f -name '*.log.*' -mtime +$DAYS_TO_CLEAN -delete\ 
#     && /usr/bin/find $PARENT_PATH/cache -type f -mtime +$DAYS_TO_CLEAN  -delete\
#     && /usr/bin/find $PARENT_PATH/build -type f -mtime +$DAYS_TO_CLEAN -delete