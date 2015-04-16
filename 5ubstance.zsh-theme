# This theme, based off alanpeabody's : (github.com/robbyrussell/oh-my-zsh/blob/1816e957770f8e3f0ad22658f741c5f0492da982/themes/alanpeabody.zsh-theme)

# rvm/rbenv stuff
local rvm=''
if which rvm-prompt &> /dev/null; then
  rvm='%{$fg[white]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm='%{$fg[white]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi

# right-aligned return code and git info
local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
local git_branch='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'

# zsh environment stuff
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%} "
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✚"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[blue]%} ✭"

# and here's the prompt
#PROMPT="%{$fg[blue]%}%c%{$fg_bold[white]%} » " # linux
PROMPT="%{$fg[blue]%}%c%{$fg_bold[white]%} ❯ " # macosx
RPROMPT="${return_code} ${git_branch} ${rvm}"
