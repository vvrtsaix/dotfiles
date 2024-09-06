export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    you-should-use
)

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"
alias cd="z"

alias lg="lazygit"

alias vim="nvim"
export EDITOR="nvim"

alias mux="tmuxinator"
alias tmuxkill="tmux kill-session"

alias cat="$(which bat) --paging=never"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

source <(fzf --zsh)
