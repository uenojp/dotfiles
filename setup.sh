#!/bin/bash

set -eux

mkdir -p "$HOME/bin"

#
# Install
#
sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y \
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

./install/zprezto.sh
./install/nvm.sh
./install/gibo.sh
./install/google-chrome.sh

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
backup() {
    targets=("$@")
    for target in ${targets[@]};do
        [ -e "$target" ] && mv "$target" "${target}.bak"
    done
    return 0
}

backup "$HOME/.vim" "$HOME/.vimrc" && ln -s "$HOME/.dotfiles/vim" "$HOME/.vim"
backup "$HOME/.latexmkrc"          && ln -s "$HOME/.dotfiles/latexmkrc" "$HOME/.latexmkrc"

ln -s "/usr/bin/batcat" "$HOME/bin/bat"

