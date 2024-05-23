#!/bin/bash

set -eux

#
# Install Cica font
#
sudo apt-get update
sudo apt-get install -y unzip wget

version=v5.0.3
wget -P /tmp "https://github.com/miiton/Cica/releases/download/$version/Cica_$version.zip"
mkdir -p ~/.fonts
unzip -d ~/.fonts "/tmp/Cica_$version.zip"
rm "/tmp/Cica_$version.zip"
fc-cache -v

