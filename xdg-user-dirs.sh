#!/bin/bash

set -eux

rmdir \
    "$HOME/Desktop" \
    "$HOME/Downloads" \
    "$HOME/Templates" \
    "$HOME/Public" \
    "$HOME/Documents" \
    "$HOME/Music" \
    "$HOME/Pictures" \
    "$HOME/Videos" \
    ;

mkdir -p "$HOME/.desktop"
mkdir -p "$HOME/dl"

xdg-user-dirs-update --set DESKTOP "$HOME/.desktop"
xdg-user-dirs-update --set DOWNLOAD "$HOME/dl"
xdg-user-dirs-update --set TEMPLATES "$HOME"
xdg-user-dirs-update --set PUBLICSHARE "$HOME"
xdg-user-dirs-update --set DOCUMENTS "$HOME"
xdg-user-dirs-update --set MUSIC "$HOME"
xdg-user-dirs-update --set PICTURES "$HOME"
xdg-user-dirs-update --set VIDEOS "$HOME"

