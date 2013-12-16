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
PATh=/usr/local/sbin:/usr/local/bin:$PATH

## ALIASES ##
alias gclone='git clone'
alias gstat='git status'
alias gadd='git add'
alias gcom='git commit'
alias gpush='git push'
alias gday='git today'
alias gun1='ssh root@vpn1.intello.com /root/bin/gun'
alias gun2='ssh root@vpn2.intello.com /root/bin/gun'
alias v='vim'
