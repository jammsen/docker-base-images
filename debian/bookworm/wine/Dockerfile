FROM jammsen/base:debian-bullseye

LABEL maintainer="Sebastian Schmidt"

ENV WINEPREFIX=/wine \
    DEBIAN_FRONTEND=noninteractive \
    PUID=0 \
    PGID=0

RUN apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common apt-transport-https gnupg2 \
    && wget https://dl.winehq.org/wine-builds/winehq.key \
    && apt-key add winehq.key \
    && rm winehq.key \
    && echo "deb https://dl.winehq.org/wine-builds/debian/ bullseye main" >> /etc/apt/sources.list.d/winehq.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends winehq-stable \
    && apt-get remove -y --purge software-properties-common apt-transport-https gnupg2 \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]