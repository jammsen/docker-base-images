FROM jammsen/base:debian-bullseye

LABEL maintainer="Sebastian Schmidt"

ENV WINEPREFIX=/wine \
    DEBIAN_FRONTEND=noninteractive \
    PUID=0 \
    PGID=0

RUN apt-get update \
    && apt-get install -y xvfb winbind cabextract \
    && wget https://dl.winehq.org/wine-builds/winehq.key \
    && apt-key add winehq.key \
    && rm winehq.key \
    && apt-add-repository https://dl.winehq.org/wine-builds/debian/ \
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