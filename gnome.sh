#!/bin/bash

set -eux

# Swap caps and ctrl
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:swapcaps']"

# Set input sources to English and Japanese
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'mozc-jp')]"
# Switch between English and Japanese with Ctrl+Space
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Primary>space']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Primary><Shift>space']"

# Hide Dock
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false

# Change UI font
gsettings set org.gnome.desktop.interface font-name "Noto Sans CJK JP 11"

