# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Make sure PHP 7 and XDEBUG is loaded
# export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
# export XDEBUG_CONFIG="remote_enable=1 remote_mode=req remote_port=9001 remote_host=127.0.0.1 remote_connect_back=0"

# Make sure coreutils are loaded before system commands
# I've disabled this for now because I only use "ls" which is
# referenced in my aliases.zsh file directly.
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Load custom commands
export PATH="$DOTFILES/bin:$PATH"

# Local bin directories before anything else
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH=${PATH}:${HOME}/.composer/vendor/bin;

# spark
export PATH="$HOME/projects/spark-installer:$PATH"

# npm-global
export PATH="$HOME/.npm-global/bin:$PATH"

# We're using Node 14 because of issues
export PATH="/opt/homebrew/opt/node@14/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/node@14/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@14/include"

# homebrew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"