# For dotfiles
export XDG_CONFIG_HOME="$HOME/.config"
# For user specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
# For user cached files
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export EDITOR="nvim"
export VISUAL="nvim"

#PATHS
export PATH="$HOME/.local/bin:$HOME/.local/bin/scripts:$HOME/.local/bin/scripts/statusbar:$PATH"
export PATH="$XDG_CONFIG_HOME/composer/vendor/bin:$PATH"
export PATH="$HOME/go/bin/:$PATH"
export PATH="$XDG_DATA_HOME/gem/ruby/3.0.0/bin:$PATH"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History filepath
export HISTFILE="$ZDOTDIR/.zhistory"

# Maximum events in history file
export SAVEHIST=100000

export DOTFILES="$HOME/.dotfiles"
