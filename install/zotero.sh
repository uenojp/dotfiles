#!/bin/bash

set -eux

#
# Install zotero
#
# ref. https://github.com/retorquere/zotero-deb

curl -sL https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh | sudo bash

sudo apt-get update \
    && sudo apt-get install -y zotero

