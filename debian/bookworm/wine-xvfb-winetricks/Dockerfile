FROM jammsen/base:debian-bookworm

LABEL maintainer="Sebastian Schmidt"

ENV WINEPREFIX=/wine \
    DEBIAN_FRONTEND=noninteractive \
    PUID=0 \
    PGID=0

RUN apt-get update \
    && apt-get install -y xvfb winbind cabextract \
    && mkdir -pm755 /etc/apt/keyrings \
    && wget --output-document /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key \
    && wget --timestamping --directory-prefix=/etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources \
    && apt-get update \
    && apt-get install -y winehq-stable \
    && wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks \
    && chmod +x ./winetricks \
    && WINEDLLOVERRIDES="mscoree,mshtml=" wineboot -u \
    && wineserver -w \
    && ./winetricks -q winhttp wsh57 vcrun6sp6 \
    && apt-get remove -y software-properties-common apt-transport-https cabextract \
    && apt-get clean \
    && rm -rf winetricks /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]