#!/usr/bin/env bash
echo "#############################################################################"
echo "# Building base:debian-bullseye image ..."
echo "#############################################################################"
docker build "$@" --tag jammsen/base:debian-bullseye .
echo "#############################################################################"
echo "# Building base:wine-stable-debian-bullseye image ..."
echo "#############################################################################"
docker build "$@" --tag jammsen/base:wine-stable-debian-bullseye wine
#echo "#############################################################################"
#echo "# Building base:wine-stable-xvfb-winetricks-debian-bullseye image ..."
#echo "#############################################################################"
#docker build "$@" --tag jammsen/base:wine-stable-xvfb-winetricks-debian-bullseye wine-xvfb-winetricks
echo "#############################################################################"
echo "# All done building images ..."
echo "#############################################################################"