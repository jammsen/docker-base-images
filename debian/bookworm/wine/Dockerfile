FROM jammsen/base:debian-bookworm

LABEL maintainer="Sebastian Schmidt"

ENV WINEPREFIX=/wine \
    DEBIAN_FRONTEND=noninteractive \
    PUID=0 \
    PGID=0

RUN apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common apt-transport-https gnupg2 \
    && mkdir -pm755 /etc/apt/keyrings \
    && wget --output-document /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key \
    && wget --timestamping --directory-prefix=/etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources \
    && apt-get update \
    && apt-get install -y --no-install-recommends winehq-stable \
    && apt-get remove -y --purge software-properties-common apt-transport-https gnupg2 \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]
