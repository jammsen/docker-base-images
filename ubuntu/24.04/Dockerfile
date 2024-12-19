FROM ubuntu:24.04

LABEL maintainer="Sebastian Schmidt"

ENV TIMEZONE=Europe/Berlin \
    DEBIAN_FRONTEND=noninteractive \
    PUID=0 \
    PGID=0

RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
    && echo $TIMEZONE > /etc/timezone \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y lib32gcc-s1 wget software-properties-common procps apt-transport-https \
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]