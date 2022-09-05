#!/bin/bash

set -eux

#
# Install Google Chrome
#
# ref. https://code.visualstudio.com/docs/setup/linux
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    gnupg2 \
    wget \
    ;

[ ! -e /usr/share/keyrings/packages.microsoft.gpg ] \
    && wget -O- https://packages.microsoft.com/keys/microsoft.asc \
    | sudo gpg --dearmor -o /usr/share/keyrings/packages.microsoft.gpg
[ ! -e /etc/apt/sources.list.d/vscode.list ] \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" \
    | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null

sudo apt-get update
sudo apt-get install -y code

