#!/bin/bash

set -eux

### Install
sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y vim-gtk xclip zsh;
sudo chsh -s /bin/zsh "$USER"

# Install zprezto
zsh -c 'git clone --recursive https://github.com/utaka/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
(cd "${ZDOTDIR:-$HOME}/.zprezto" && git switch utaka)
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done'

### Config
# Configure Git environment
git config --global user.name "Takahiro Ueno"
git config --global user.email "uenotakahiro.jp@gmail.com"
git config --global color.ui auto
git config --global core.editor vim
git config --global init.defaultBranch main

# Create symlink
ln -s "$HOME/.dotfiles/vimrc" "$HOME/.vimrc"

