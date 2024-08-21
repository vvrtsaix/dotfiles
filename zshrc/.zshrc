export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    you-should-use
    zsh-bat
)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"

alias mux="tmuxinator"
alias tmuxkill="tmux kill-session"
