ARG PARENT_PATH=/data/xnat/
ARG DAYS_TO_CLEAN=60
ARG UBUNTU_VERSION=22.04
FROM ubuntu:${UBUNTU_VERSION}

# Clean logs files older than 30 days
CMD  /usr/bin/find ${PARENT_PATH}/home/logs -name '*.log.*' -mtime +${DAYS_TO_CLEAN}  \ 
     && /usr/bin/find ${PARENT_PATH}/cache -mtime +${DAYS_TO_CLEAN}  \
     && /usr/bin/find ${PARENT_PATH}/build -mtime +${DAYS_TO_CLEAN} 