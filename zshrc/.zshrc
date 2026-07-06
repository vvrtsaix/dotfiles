# ---- Oh My Zsh -------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  git-open
  zsh-autosuggestions
  zsh-syntax-highlighting
  you-should-use
)

# Load extra completions before Oh My Zsh initializes completion.
[[ -d "$HOME/.docker/completions" ]] && fpath=("$HOME/.docker/completions" $fpath)

source "$ZSH/oh-my-zsh.sh"

# ---- Editor ----------------------------------------------------------------
if (( $+commands[nvim] )); then
  alias vim="nvim"
fi

if [[ -n "$SSH_CONNECTION" ]]; then
  export EDITOR="vim"
else
  export EDITOR="${${commands[nvim]:+nvim}:-vim}"
fi
export VISUAL="$EDITOR"

# ---- Navigation -------------------------------------------------------------
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
  alias cd="z"
fi

mm() {
  mkdir -p "$1" && cd "$1"
}

ff() {
  (( $+commands[fd] && $+commands[fzf] )) || {
    echo "ff requires fd and fzf" >&2
    return 1
  }

  local dir
  dir=$(fd --type d --hidden | fzf) || return
  cd "$dir" || return
}

# ---- Aliases ----------------------------------------------------------------
alias lg="lazygit"
alias ld="lazydocker"
alias y="yazi"

alias tk="tmux kill-session"
alias tl="tmux ls"
alias ta="tmux attach -t"
alias tn="tmux new -s"

[[ -x "$HOME/.scripts/up.sh" ]] && alias up="$HOME/.scripts/up.sh"

alias ssh="TERM=xterm-256color ssh"

# ---- Tooling ----------------------------------------------------------------
(( $+commands[fzf] )) && source <(fzf --zsh)

if (( $+commands[kubectl] )); then
  source <(kubectl completion zsh)
  alias k="kubectl"
  compdef _kubectl k
fi

(( $+commands[mise] )) && eval "$(mise activate zsh)"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/and/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export LIBRARY_PATH="$LIBRARY_PATH:/opt/homebrew/Cellar/gcc/16.1.0/lib/gcc/current/gcc/aarch64-apple-darwin25/16"
