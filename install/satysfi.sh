#!/bin/bash

set -eux

#
# Install SATySFi
#
# ref. https://github.com/gfngfn/SATySFi/blob/master/README-ja.md

sudo apt-get update
sudo apt-get install -y \
    build-essential \
    curl \
    git \
    m4 \
    pkg-config \
    unzip \
    ;
sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)

# Set up OPAM
opam init
# Instead of eval, write opam configuration to .zshrc on opam init
# eval $(opam env)
opam repository add satysfi-external https://github.com/gfngfn/satysfi-external-repo.git
opam repository add satyrographos https://github.com/na4zagin3/satyrographos-repo.git
opam update

# Install SATySFi
opam depext satysfi satysfi-dist satyrographos
opam install satysfi satysfi-dist satyrographos

# Set up the SATySFi standard library
satyrographos install

