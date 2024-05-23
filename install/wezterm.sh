#!/bin/bash

set -eux

#
# Install WezTerm
#
# ref. https://wezfurlong.org/wezterm/install/linux.html#__tabbed_1_3
sudo apt-get update

curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list

sudo apt-get update
sudo apt-get install -y wezterm

