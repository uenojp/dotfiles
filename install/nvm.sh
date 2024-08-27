#!/bin/zsh

#
# Install nvm and node
#
NVM_LATEST=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | awk '/tag_name/{print $2}' | tr -d '",')
SHELL=/bin/zsh
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_LATEST/install.sh" | bash
source "${ZDOTDIR-HOME}/.zshenv"
nvm install node

