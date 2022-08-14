#!/bin/bash

set -eux

mkdir -p "$HOME/bin"

#
# Install
#
apt-get update
apt-get upgrade -y

apt-get install -y \
    bat \
    build-essential \
    curl \
    gdb \
    gh \
    jq \
    nkf \
    shellcheck \
    tree \
    vim-gtk \
    w3m \
    wget \
    xclip \
    zsh \
    ;
chsh -s /bin/zsh "$USER"

./install/zprezto.sh &
p1=$!
./install/nvm.sh &
p2=$!
./install/gibo.sh &
p3=$!

wait $p1
wait $p2
wait $p3

#
# Config
#
# Configure Git environment
git config --global user.name "Takahiro Ueno"
git config --global user.email "uenotakahiro.jp@gmail.com"
git config --global color.ui auto
git config --global core.editor vim
git config --global init.defaultBranch main

# Create symlink
ln -s "$HOME/.dotfiles/vim" "$HOME/.vim"
ln -s "$HOME/.dotfiles/latexmkrc" "$HOME/.latexmkrc"

if [ -e /usr/bin/batcat ]; then
    ln -s "/usr/bin/batcat" "$HOME/bin/bat"
fi

