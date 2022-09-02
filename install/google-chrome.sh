#!/bin/bash

set -eux

#
# Install Google Chrome
#
# ref. https://www.linuxcapable.com/how-to-install-google-chrome-on-ubuntu-22-04-lts/
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    gnupg2 \
    ubuntu-keyring \
    wget \
    ;

[ ! -e /usr/share/keyrings/google-chrome.gpg ] \
    && wget -O- https://dl.google.com/linux/linux_signing_key.pub \
    | sudo gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg
[ ! -e /etc/apt/sources.list.d/google-chrome.list ] \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" \
    | sudo tee /etc/apt/sources.list.d/google-chrome.list > /dev/null

sudo apt-get update
sudo apt-get install -y google-chrome-stable

