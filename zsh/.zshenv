# For dotfiles
export XDG_CONFIG_HOME="$HOME/.config"
# For user specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
# For user cached files
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export EDITOR="nvim"
export VISUAL="nvim"

#PATHS
export PATH="$HOME/.local/bin:$HOME/.local/bin/scripts:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/go/bin/:$PATH"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History filepath
export HISTFILE="$ZDOTDIR/.zhistory"

# Maximum events in history file
export SAVEHIST=100000

export DOTFILES="$HOME/.dotfiles"

# fzf and ripgrep
# export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
