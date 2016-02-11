## ZSH ##
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="5ubstance"
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

## FUNCTIONS
function delete_remote_tag(){
  if [ $1 ]; then
    echo "Delete tag(s) : $@?";
    select answer in "Yes" "No"; do
      case $answer in
	Yes ) for tag in "$@"; do git tag -d $tag; git push origin :refs/tags/$tag; done; break;;
	No ) break;;
      esac
    done
  else
    echo "Please give me a tag to work with"
    exit 1
  fi
}

## BREW ##
if [[ "$unamestr" == "Darwin" ]]; then
    PATH="/usr/local/sbin:/usr/local/bin:$PATH"
fi

## RBENV ##
PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)" 

## IMPACTIFY ##
eval "$($HOME/.impactify/libexec/impactify init -)"
PERL_MB_OPT="--install_base \"/Users/philippe/perl5\""; export PERL_MB_OPT;	 
PERL_MM_OPT="INSTALL_BASE=/Users/philippe/perl5"; export PERL_MM_OPT;

## GLI ##
## this enables bash completion in ZSH
if [[ -n ${ZSH_VERSION-} ]]; then
  autoload -U +X bashcompinit && bashcompinit
fi
## instruct, where the completions for my-cli come from
complete -F get_my_cli_commands droid
function get_my_cli_commands()
{
  ## we have following variables available:
  # - COMP_WORDS: array with arguments, that starts with  "my-cli"
  # - COMP_CWORD: the index of the current "tab-completed" word
  local binary="droid"
  # args-array starting by index:1
  help_params=${COMP_WORDS[@]:1}
  # remove flags/options, so we have only "verbs"
  clean_params=${help_params//-*([^ ])?( )}
  COMPREPLY=(`$binary help -c $clean_params`)
}

## ADB (depends on android sdk, java jvm... I installed this with AndroidStudio
PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

## Quick pastebin service integration
function paste.click(){
  if [ -z "$1" ]; then
    curl -s --data-binary @- paste.click/s/;
  else
    curl -s --data-binary @$1 paste.click;
  fi;
};

## PLENV (impact-client)
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"

## ALIASES ##
alias gclone='git clone'
alias gstat='git status'
alias gadd='git add'
alias gdiff='git diff'
alias gcom='git commit'
alias gpsh='git push'
alias gpll='git pull'
alias gstash='git stash'
alias grevert='echo "Go back one commit?"; \
  select answer in "Yes" "No"; do \
    case $answer in \
      Yes ) git reset HEAD^ --hard; break;; \
      No ) break;; \
    esac \
  done'

alias gtagrm="delete_remote_tag $1"
alias gun1='ssh root@vpn1.intello.com /root/bin/gun'
alias gun2='ssh root@vpn2.intello.com /root/bin/gun'
alias v='vim'
alias sshn='ssh -t root@nova ssh'
alias gday='git log --since=midnight --author='Philippe Desautels' --oneline --color'
alias glog='git log --oneline --decorate --color --graph --name-status'
alias paste-click='paste.click'
alias cpaste='paste.click'
alias c='clear'
alias tmux="TERM=screen-256color-bce tmux"

# OSX system mods
# to fix issue with ansible forks : https://github.com/ansible/ansible/issues/12259
ulimit -n 2048

# zsh syntax highlighting (requires `brew install zsh-syntax-highlighting` first)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
