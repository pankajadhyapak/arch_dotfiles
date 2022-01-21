alias shrug="echo '¯\_(ツ)_/¯' | xclip"
# alias s="newScratchpad"
alias composer="php -d memory_limit=-1 /usr/bin/composer"
alias c="/usr/bin/code"
alias ez="nvim $ZDOTDIR/.zshrc"
alias sz="source $ZDOTDIR/.zshrc"
alias art="php artisan"
alias code="cd ~/code"
alias ls="lsd -la"
# alias youtdl='youtube-dl -o "~/Documents/Youtube_Videos/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" --all-subs --external-downloader aria2c'
alias n="nvim"
alias vim="nvim"
alias gmv="go mod vendor"
alias nc="n ~/.config"
alias a="clear"
alias history="history 0 |  fzf --layout=reverse --height 50% --tac"
# GIT
# --------------------------------------------
alias g="lazygit"
alias gs="git status"
alias gd="git diff"
alias gnah="git reset --hard; git clean -df;"
alias gf="git fetch -ap"
alias gec="git commit --amend --no-edit && git push -f"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gdel="git branch -D"
alias branchclean="git branch | grep -v '^*' | xargs git branch -D"
alias gcm='git checkout master && git pull'


#DOCKER
alias dkall="docker stop $(docker ps -a -q)"
alias dps="docker ps"
alias l="lazydocker"

#GO
alias go-lint="golangci-lint -c .golangci.yml run ./pkg/..."
alias go-format="gofmt -s -w . && goimports -l -w ."

#Laravel
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

# Lock the screen
alias afk="betterlockscreen -l dimblur"


alias x="startx"
