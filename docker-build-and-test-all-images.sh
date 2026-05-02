#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

build_and_test() {
    local tag="$1"
    local file="$2"
    local context="$3"

    echo "#############################################################################"
    echo "# Building ${tag} ..."
    echo "#############################################################################"
    docker build --file "${file}" --tag "jammsen/base:${tag}" "${context}"

    echo "#############################################################################"
    echo "# Testing ${tag} ..."
    echo "#############################################################################"
    docker run --rm "jammsen/base:${tag}" id
}

cleanup() {
    echo "#############################################################################"
    echo "# Image sizes before cleanup:"
    echo "#############################################################################"
    docker images --format "table {{.Repository}}:{{.Tag}}\t{{.Size}}" | grep -E "$(echo "$@" | tr ' ' '|')"
    echo "#############################################################################"
    echo "# Cleaning up images: $* ..."
    echo "#############################################################################"
    docker rmi "$@"
}

build_and_test "debian-bookworm-base"                        debian/bookworm/Dockerfile.base                  debian/bookworm
build_and_test "debian-bookworm-wine-stable"                 debian/bookworm/Dockerfile.wine                  debian/bookworm
build_and_test "debian-bookworm-wine-stable-xvfb-winetricks" debian/bookworm/Dockerfile.wine-xvfb-winetricks  debian/bookworm
cleanup jammsen/base:debian-bookworm-base jammsen/base:debian-bookworm-wine-stable jammsen/base:debian-bookworm-wine-stable-xvfb-winetricks

build_and_test "debian-trixie-base"                          debian/trixie/Dockerfile.base                    debian/trixie
build_and_test "debian-trixie-wine-stable"                   debian/trixie/Dockerfile.wine                    debian/trixie
build_and_test "debian-trixie-wine-stable-xvfb-winetricks"   debian/trixie/Dockerfile.wine-xvfb-winetricks    debian/trixie
cleanup jammsen/base:debian-trixie-base jammsen/base:debian-trixie-wine-stable jammsen/base:debian-trixie-wine-stable-xvfb-winetricks

build_and_test "ubuntu-26.04-base"                           ubuntu/26.04/Dockerfile.base                     ubuntu/26.04
build_and_test "ubuntu-26.04-wine-stable"                    ubuntu/26.04/Dockerfile.wine                     ubuntu/26.04
build_and_test "ubuntu-26.04-wine-stable-xvfb-winetricks"    ubuntu/26.04/Dockerfile.wine-xvfb-winetricks     ubuntu/26.04
cleanup jammsen/base:ubuntu-26.04-base jammsen/base:ubuntu-26.04-wine-stable jammsen/base:ubuntu-26.04-wine-stable-xvfb-winetricks

echo "#############################################################################"
echo "# All images built, tested and cleaned up successfully!"
echo "#############################################################################"
