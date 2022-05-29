#!/bin/bash

set -eux

mkdir -p "$HOME/bin"

### Install
sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y \
    bat \
    build-essential \
    curl \
    gdb \
    gh \
    nkf \
    shellcheck \
    tree \
    vim-gtk \
    wget \
    xclip \
    zsh \
    ;
sudo chsh -s /bin/zsh "$USER"

# Install zprezto
zsh -c 'git clone --recursive https://github.com/utaka/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
cd "${ZDOTDIR:-$HOME}/.zprezto"
git switch utaka
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done'

# Install nvm and node
zsh -c $'NVM_LATEST=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | awk \'/tag_name/{print $2}\' | tr -d \'",\')
SHELL=/bin/zsh; curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_LATEST/install.sh" | bash
source "$HOME/.zshrc"
nvm install node'

### Config
# Configure Git environment
git config --global user.name "Takahiro Ueno"
git config --global user.email "uenotakahiro.jp@gmail.com"
git config --global color.ui auto
git config --global core.editor vim
git config --global init.defaultBranch main

# Create symlink
ln -s "$HOME/.dotfiles/vim" "$HOME/.vim"

if [ -e /usr/bin/batcat ]; then
    ln -s "/usr/bin/batcat" "$HOME/bin/bat"
fi

