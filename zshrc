[ -r /etc/zsh/zshrc ] && source /etc/zsh/zshrc

setopt no_beep
# Emacs keybinds
bindkey -e
# Use '/' as delimiter
export WORDCHARS="$(tr -d '/' <<< "$WORDCHARS")"
# Set LS_COLORS
eval $(dircolors | sed 's/ow=..;../ow=01;35/')
# Use LS_COLORS in completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# Enable completion cache
zstyle ':completion:*' use-cache yes
autoload -Uz compinit && compinit

alias mkdir='mkdir -p'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ln='ln -i'
alias ls='ls --color=auto --group-directories-first'
alias ..='cd ..'
alias ...='cd ../..'

alias l='ls -1A'
alias ll='ls -lh'
alias lr='ll -R'
alias la='ll -A'
alias lk='ll -Sr'
alias lt='ll -tr'
alias lc='lt -c'
alias lu='lt -u'

alias gia='git add'
alias gcm='git commit -m'
alias gco='git checkout'
alias gfm='git pull'
alias gs='git status'
alias gsu='git status -u'
alias gsu.='git status -u .'
alias gd='git diff --color=auto'
alias gl='git log --color=auto'
alias gp='git push'
alias gb='git branch'
alias gw='git switch'

eval "$(starship init zsh)"

source "$HOME/.dotfiles/zshenv.d/cargo.sh"
source "$HOME/.dotfiles/zshenv.d/conda.sh"
source "$HOME/.dotfiles/zshenv.d/nvm.sh"

