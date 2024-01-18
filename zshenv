export EDITOR='vim'
export VISUAL='vim'

TIMEFMT='  real %*E  user %*U  kernel %*S  %J'

# Remove duplicates
typeset -gU PATH path
path=(
    $HOME/bin(N-/)
    $HOME/go/bin(N-/)
    /usr/local/go/bin(N-/)
    $path
)

source "$HOME/.dotfiles/zshenv.d/cargo.sh"
source "$HOME/.dotfiles/zshenv.d/conda.sh"
source "$HOME/.dotfiles/zshenv.d/nvm.sh"

