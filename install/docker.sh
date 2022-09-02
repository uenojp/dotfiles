#!/bin/bash

set -eux

#
# Install Docker
#
# ref. https://docs.docker.com/engine/install/ubuntu/
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg2 \
    lsb-release \
    ;

[ ! -e /etc/apt/keyrings/docker.gpg ] \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
    | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
[ ! -e /etc/apt/sources.list.d/docker.list ] \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo usermod -aG docker "$USER"

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

