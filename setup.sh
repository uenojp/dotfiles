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
    fzf \
    gawk \
    gdb \
    gh \
    shellcheck \
    tmux \
    tree \
    vim-gtk3 \
    wget \
    wireshark \
    xclip \
    zsh \
    ;

chsh -s /bin/zsh "$USER"
curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir="$HOME/bin"

backup() {
    targets=("$@")
    for target in "${targets[@]}"; do
        if [ -e "$target" ]; then
            mv "$target" "${target}.bak"
        fi
    done
}

mkdir -p "$HOME/.config"
backup "$HOME/.zshenv"                  ; ln -sf "$PWD/zshenv"          "$HOME/.zshenv"
backup "$HOME/.zsh"                     ; ln -sf "$PWD/zsh"             "$HOME/.zsh" # =$ZDOTDIR defined in zshenv
backup "$HOME/.clang-format"            ; ln -sf "$PWD/clang-format"    "$HOME/.clang-format"
backup "$HOME/.wezterm.lua"             ; ln -sf "$PWD/wezterm.lua"     "$HOME/.wezterm.lua"
backup "$HOME/.config/starship.toml"    ; ln -sf "$PWD/starship.toml"   "$HOME/.config/starship.toml"
backup "$HOME/.latexmkrc"               ; ln -sf "$PWD/latexmkrc"       "$HOME/.latexmkrc"
backup "$HOME/.tmux.conf"               ; ln -sf "$PWD/tmux.conf"       "$HOME/.tmux.conf"
backup "$HOME/.vim" "$HOME/.vimrc"      ; ln -sf "$PWD/vim"             "$HOME/.vim"

ln -sf "/usr/bin/batcat"    "$HOME/bin/bat"
ln -sf "$PWD/bin/line"      "$HOME/bin/line"
ln -sf "$PWD/bin/ob"       "$HOME/bin/ob"
ln -sf "$PWD/bin/o"         "$HOME/bin/o"

git config --global user.name "Takahiro Ueno"
git config --global user.email "uenotakahiro.jp@gmail.com"
git config --global color.ui auto
git config --global core.editor vim
git config --global core.quotepath false
git config --global init.defaultBranch main

