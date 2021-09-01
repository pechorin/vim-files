# zsh cache dir
mkdir -p ~/tmp/zsh/
export ZSH_CACHE_DIR="$HOME/tmp/zsh/"

# cargo (rust)
test -r "$HOME/.cargo/env" && source "$HOME/.cargo/env";


# homebrew
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

# fnm (node version manager)
export FNM="$HOME/.fnm"

# go packets bin
export PATH="$HOME/go/bin/:$PATH"
