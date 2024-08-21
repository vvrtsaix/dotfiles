eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export BUN_INSTALL="$HOME/.bun" 
export FLUTTER_HOME="$HOME/development/flutter"
export GOPATH="$HOME/go"
export ANDROID_HOME="$HOME/Library/Android/sdk"

export PATH="$ANDROID_HOME/platform-tools:$HOME/.emacs.d/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$GOPATH/bin:$FLUTTER_HOME/bin:$BUN_INSTALL/bin:$PATH"
