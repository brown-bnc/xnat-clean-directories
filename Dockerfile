
ARG UBUNTU_VERSION=22.04
FROM ubuntu:$UBUNTU_VERSION
ENV PARENT_PATH=/data/xnat
ENV DAYS_TO_CLEAN=60

# Clean logs files older than $DAYS_TO_CLEAN days
CMD  /usr/bin/find $PARENT_PATH/home/logs -name '*.log.*' -mtime +$DAYS_TO_CLEAN \ 
     && /usr/bin/find $PARENT_PATH/cache -mtime +$DAYS_TO_CLEAN  \
     && /usr/bin/find $PARENT_PATH/build -mtime +$DAYS_TO_CLEAN 
