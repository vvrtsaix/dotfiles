if [[ ":$FPATH:" != *":/Users/aube/.zsh/completions:"* ]]; then export FPATH="/Users/aube/.zsh/completions:$FPATH"; fi
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
alias ld="lazydocker"

alias up="~/.scripts/up.sh"

alias vim="nvim"
export EDITOR="nvim"

alias mux="tmuxinator"
alias tk="tmux kill-session"
alias tl="tmux ls"
alias ta="tmux attach -t"

alias cat="$(which bat) --paging=never"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

source <(fzf --zsh)

# bun completions
[ -s "/Users/aube/.bun/_bun" ] && source "/Users/aube/.bun/_bun"
