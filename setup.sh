#!/bin/bash

set -eux

mkdir -p "$HOME/bin"

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y \
    arp-scan \
    bat \
    build-essential \
    clang-format \
    cmake \
    curl \
    foot \
    gawk \
    gdb \
    gh \
    shellcheck \
    tmux \
    tree \
    vim-gtk \
    wget \
    wireshark \
    xclip \
    zsh \
    ;
chsh -s /bin/zsh "$USER"

backup() {
    targets=("$@")
    for target in "${targets[@]}";do
        [ -e "$target" ] && mv "$target" "${target}.bak"
    done
}

backup "$HOME/.clang-format"       && ln -s "$HOME/.dotfiles/clang-format"  "$HOME/.clang-format"
backup "$HOME/.latexmkrc"          && ln -s "$HOME/.dotfiles/latexmkrc"     "$HOME/.latexmkrc"
backup "$HOME/.tmux.conf"          && ln -s "$HOME/.dotfiles/tmux.conf"     "$HOME/.tmux.conf"
backup "$HOME/.vim" "$HOME/.vimrc" && ln -s "$HOME/.dotfiles/vim"           "$HOME/.vim"

ln -s "/usr/bin/batcat" "$HOME/bin/bat"
ln -s "$HOME/.dotfiles/bin/line"    "$HOME/bin/line"
ln -s "$HOME/.dotfiles/bin/obs"     "$HOME/bin/obs"
ln -s "$HOME/.dotfiles/bin/o"       "$HOME/bin/o"

