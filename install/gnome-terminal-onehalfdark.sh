#!/bin/bash

set -eux

#
# Install One Half Dark
#
# ref. https://ncona.com/2019/11/configuring-gnome-terminal-programmatically/
sudo apt install wget
wget -O- https://raw.githubusercontent.com/sonph/onehalf/master/gnome-terminal/onehalfdark.sh | bash

uuid="$(gsettings get org.gnome.Terminal.ProfilesList list | tr -d "\',[]" | awk '{print $NF}')"
gsettings set org.gnome.Terminal.ProfilesList default "$uuid"
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$uuid"/ use-system-font false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$uuid"/ font 'Monospace 16'

