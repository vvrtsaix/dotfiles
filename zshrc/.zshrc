if [[ ":$FPATH:" != *":/Users/aube/.zsh/completions:"* ]]; then export FPATH="/Users/aube/.zsh/completions:$FPATH"; fi
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    git-open
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

source <(fzf --zsh)

autoload -U compinit
compinit

# bun completions
[ -s "/Users/aube/.bun/_bun" ] && source "/Users/aube/.bun/_bun"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
