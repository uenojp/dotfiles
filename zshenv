export EDITOR='vim'
export VISUAL='vim'

# Remove duplicates
typeset -gU PATH path
path=(
    $HOME/bin(N-/)
    $HOME/go/bin(N-/)
    /usr/local/go/bin(N-/)
    $path
)

TIMEFMT='  real %*E  user %*U  kernel %*S  %J'

