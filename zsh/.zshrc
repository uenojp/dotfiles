mkdir -p "$ZDOTDIR"

autoload -U compinit && compinit

setopt no_beep

HISTFILE="$HOME/.zsh_history"
SAVEHIST=1048576
HISTSIZE=1048576
setopt share_history
setopt append_history
setopt extended_history
setopt hist_ignore_dups
setopt hist_expire_dups_first
# cmd --path=<filename expantion is performed here>
setopt magic_equal_subst

setopt interactive_comments
# Use >! instead of > when overwriting
setopt noclobber

setopt pipefail

# Emacs keybinds
bindkey -e
# Use '/' as delimiter
WORDCHARS="$(tr -d '/' <<< "$WORDCHARS")"

eval $(dircolors | sed 's/ow=..;../ow=01;35/')
# Use LS_COLORS in completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' use-cache yes
# Approximate completion, e.g. cat typo<TAB> -> cat type
setopt correct
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:approximate:*' max-errors 1 numeric

source /usr/share/doc/fzf/examples/key-bindings.zsh
source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Aliases
alias mkdir='mkdir -p'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ln='ln -i'
alias ls='ls --color=auto --group-directories-first'
alias ..='cd ..'
alias ...='cd ../..'
alias clip='xclip -selection clipboard'
alias diff='diff -u --color=auto'
alias grep='grep --color=auto'
alias p='less -R'

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
alias gfc='git clone'
alias gs='git status'
alias gsu='git status -u'
alias gsu.='git status -u .'
alias gd='git diff --color=auto'
alias gdc='git diff --color=auto --cached'
alias gdf='git difftool'
alias gl='git log --color=auto'
alias gp='git push'
alias gb='git branch'
alias gw='git switch'

eval "$(starship init zsh)"

