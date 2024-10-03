echo "#############################################################################"
echo "# Building base:debian-bookworm image ..."
echo "#############################################################################"
docker build --tag jammsen/base:debian-bookworm .
echo "#############################################################################"
echo "# Building base:wine-stable-debian-bookworm image ..."
echo "#############################################################################"
docker build --tag jammsen/base:wine-stable-debian-bookworm wine
#echo "#############################################################################"
#echo "# Building base:wine-stable-xvfb-winetricks-debian-bookworm image ..."
#echo "#############################################################################"
#docker build --tag jammsen/base:wine-stable-xvfb-winetricks-debian-bookworm wine-xvfb-winetricks
echo "#############################################################################"
echo "# All done building images ..."
echo "#############################################################################"