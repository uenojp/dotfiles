#!/bin/bash

set -eux

mkdir -p "$HOME/bin"

sudo apt-get update
sudo apt-get upgrade -y

# foot \
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
    vim-gtk \
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
        [ -e "$target" ] && mv "$target" "${target}.bak"
    done
}

mkdir -p "$HOME/.config"
backup "$HOME/.zshenv"                  && ln -sf "$HOME/.dotfiles/zshenv"          "$HOME/.zshenv"
backup "$HOME/.zshrc"                   && ln -sf "$HOME/.dotfiles/zshrc"           "$HOME/.zshrc"
backup "$HOME/.clang-format"            && ln -sf "$HOME/.dotfiles/clang-format"    "$HOME/.clang-format"
#mkdir -p "$HOME/.config/foot" &&
#    backup "$HOME/.config/foot.ini"     && ln -sf "$HOME/.dotfiles/foot.ini"        "$HOME/.config/foot/foot.ini"
backup "$HOME/.wezterm.lua"             && ln -sf "$HOME/.dotfiles/wezterm.lua"     "$HOME/.wezterm.lua"
backup "$HOME/.config/starship.toml"    && ln -sf "$HOME/.dotfiles/starship.toml"   "$HOME/.config/starship.toml"
backup "$HOME/.latexmkrc"               && ln -sf "$HOME/.dotfiles/latexmkrc"       "$HOME/.latexmkrc"
backup "$HOME/.tmux.conf"               && ln -sf "$HOME/.dotfiles/tmux.conf"       "$HOME/.tmux.conf"
backup "$HOME/.vim" "$HOME/.vimrc"      && ln -sf "$HOME/.dotfiles/vim"             "$HOME/.vim"

ln -sf "/usr/bin/batcat"             "$HOME/bin/bat"
ln -sf "$HOME/.dotfiles/bin/line"    "$HOME/bin/line"
ln -sf "$HOME/.dotfiles/bin/obs"     "$HOME/bin/obs"
ln -sf "$HOME/.dotfiles/bin/o"       "$HOME/bin/o"

