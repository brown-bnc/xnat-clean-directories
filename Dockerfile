ARG UBUNTU_VERSION=22.04
FROM ubuntu:$UBUNTU_VERSION
ENV PARENT_PATH=/data/xnat
ENV DAYS_TO_CLEAN=60

COPY cleanup.sh /cleanup.sh
RUN chmod +x /cleanup.sh

CMD ["/cleanup.sh"]