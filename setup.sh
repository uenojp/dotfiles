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
    clang-format \
    cmake \
    curl \
    gawk \
    gdb \
    gh \
    gnome-shell-pomodoro \
    jq \
    nkf \
    shellcheck \
    tmux \
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

git config --global alias.remote-ssh $'!git remote set-url origin "$(git remote -v | head -1 | awk \'{print $2}\' | sed \'s_https://_git@_; s_/_:_\')"'
git config --global alias.prev 'checkout HEAD^'
git config --global alias.next $'!git checkout "$(git log --format=%H "$(git name-rev --name-only HEAD | sed \'s/~.*$//\')" | grep -B1 -m1 "$(git rev-parse HEAD)" | head -1)"'

# Create symlink
backup() {
    targets=("$@")
    for target in ${targets[@]};do
        [ -e "$target" ] && mv "$target" "${target}.bak"
    done
    return 0
}

backup "$HOME/.clang-format"       && ln -s "$HOME/.dotfiles/clang-format" "$HOME/.clang-format"
backup "$HOME/.latexmkrc"          && ln -s "$HOME/.dotfiles/latexmkrc" "$HOME/.latexmkrc"
backup "$HOME/.tmux.conf"          && ln -s "$HOME/.dotfiles/tmux.conf" "$HOME/.tmux.conf"
backup "$HOME/.vim" "$HOME/.vimrc" && ln -s "$HOME/.dotfiles/vim" "$HOME/.vim"

ln -s "/usr/bin/batcat" "$HOME/bin/bat"
ln -s "$HOME/.dotfiles/bin/dict" "$HOME/bin/dict"
ln -s "$HOME/.dotfiles/bin/obs" "$HOME/bin/obs"

