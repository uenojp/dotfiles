#!/bin/bash

set -eux

#
# Install PEDA
#
mkdir -p "$HOME/bin/peda"
git clone https://github.com/longld/peda.git "$HOME/bin/peda"
echo "source $HOME/bin/peda/peda.py" >> ~/.gdbinit

