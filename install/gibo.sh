#!/bin/bash

curl -L https://raw.github.com/simonwhitaker/gibo/master/gibo \
    -so "$HOME/bin/gibo" && chmod +x "$HOME/bin/gibo" && "$HOME/bin/gibo" update

