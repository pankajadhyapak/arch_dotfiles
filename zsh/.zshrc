#!/bin/zsh

setopt AUTO_CD                  # Go to folder path without using cd.

# HISTORY
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto"


# search history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# [Ctrl-RightArrow] - move forward one word
bindkey -M emacs '^[[1;5C' forward-word
bindkey -M viins '^[[1;5C' forward-word
bindkey -M vicmd '^[[1;5C' forward-word

# [Ctrl-LeftArrow] - move backward one word
bindkey -M emacs '^[[1;5D' backward-word
bindkey -M viins '^[[1;5D' backward-word
bindkey -M vicmd '^[[1;5D' backward-word

autoload -U compinit; compinit -d "$ZSH_COMPDUMP"

prompt_precmd() {
	# shows the full path in the title
	print -Pn '\e]0;%~\a'
}

prompt_preexec() {
	cmd_timestamp=$EPOCHSECONDS

	# shows the current dir and executed command in the title when a process is active
	print -Pn "\e]0;"
	echo -nE "$PWD:t: $2"
	print -Pn "\a"
}
autoload -U add-zsh-hook
add-zsh-hook precmd prompt_precmd
add-zsh-hook preexec prompt_preexec
autoload -Uz vcs_info
autoload -U colors && colors
zstyle ':vcs_info:*' enable git
# precmd() { vcs_info }

precmd() {
    vcs_info
    if [[ -n ${vcs_info_msg_0_} ]]; then
        # vcs_info found something (the documentation got that backwards
        # STATUS line taken from https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh
        STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)
        if [[ -n $STATUS ]]; then
            # PROMPT='%F{7}%3~%f %F{red}${vcs_info_msg_0_} %f%# '
            PROMPT='%{$fg[blue]%}%1~%{$fg[yellow]%}${vcs_info_msg_0_} %{$fg[red]%} %{$reset_color%}'

        else
            PROMPT='%{$fg[blue]%}%1~%{$fg[yellow]%}${vcs_info_msg_0_} %{$fg[green]%} %{$reset_color%}'
        fi
    else
        # nothing from vcs_info
        PROMPT='%{$fg[blue]%}%1~%{$fg[yellow]%}${vcs_info_msg_0_} %{$fg[white]%} %{$reset_color%}'
    fi
}

setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats '  %b'


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/z.zsh
fpath=(/usr/share/zsh/site-functions $fpath)

source $ZDOTDIR/aliases.zsh




# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/pankaj/google-cloud-sdk/path.zsh.inc' ]; then . '/home/pankaj/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/pankaj/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/pankaj/google-cloud-sdk/completion.zsh.inc'; fi

