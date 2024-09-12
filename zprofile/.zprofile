eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export BUN_INSTALL="$HOME/.bun" 
export FLUTTER_HOME="$HOME/development/flutter"
export GOPATH="$HOME/go"
export ANDROID_HOME="$HOME/Library/Android/sdk"

export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libpq/lib/pkgconfig"

export PATH="/opt/homebrew/opt/libpq/bin:$PATH:$ANDROID_HOME/platform-tools:$HOME/.emacs.d/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$GOPATH/bin:$FLUTTER_HOME/bin:$BUN_INSTALL/bin:$PATH"
