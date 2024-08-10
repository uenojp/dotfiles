#!/bin/bash

set -eux

#
# Install Wine
#
# ref. https://wiki.winehq.org/Ubuntu
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/"$(lsb_release -sc 2> /dev/null)"/winehq-noble.sources
sudo apt update
sudo apt install --install-recommends -y winehq-staging

