## ZSH ##
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerline"
POWERLINE_RIGHT_B="none"
POWERLINE_DISABLE_RPROMPT="true"
POWERLINE_NO_BLANK_LINE="true"
# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
DISABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git brew colorize vagrant yum 5ubstance)
source $ZSH/oh-my-zsh.sh

unamestr=`uname`

## BREW ##
if [[ "$unamestr" == "Darwin" ]]; then
    PATH="/usr/local/sbin:/usr/local/bin:$PATH"
fi

## RBENV ##
if [[ "$unamestr" == "Darwin" ]]; then
    PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)" 
fi

## ALIASES ##
alias gclone='git clone'
alias gstat='git status'
alias gadd='git add'
alias gdiff='git diff'
alias gcom='git commit'
alias gpsh='git push'
alias gpll='git pull'
alias gday='git today'
alias gstash='git stash'
alias gun1='ssh root@vpn1.intello.com /root/bin/gun'
alias gun2='ssh root@vpn2.intello.com /root/bin/gun'
alias v='vim'
alias sshn='ssh -t root@nova ssh'

## Vi mode for the win !!
#bindkey -v
