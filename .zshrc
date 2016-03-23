## ZSH ##
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="5ubstance"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
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

alias gtag="git tag"
alias gtagrm="delete_remote_tag $1"
alias gun1='ssh root@vpn1.intello.com /root/bin/gun'
alias gun2='ssh root@vpn2.intello.com /root/bin/gun'
alias v='vim'
alias sshn='ssh -t root@nova ssh'
alias gday='git log --since=midnight --author='Philippe Desautels' --oneline --color'
alias glog='git log --oneline --decorate --color --graph --name-status'
alias c='clear'
alias tmux="TERM=screen-256color-bce tmux"

# OSX system mods
# to fix issue with ansible forks : https://github.com/ansible/ansible/issues/12259
ulimit -n 2048

# zsh syntax highlighting (requires `brew install zsh-syntax-highlighting` first)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# the fuck
eval $(thefuck --alias)
