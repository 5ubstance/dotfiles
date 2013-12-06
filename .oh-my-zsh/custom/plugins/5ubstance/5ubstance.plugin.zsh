# Adds a "c" command which will cd into a project directory
c() { cd ~/code/$1; }

# This adds the autocompletion functionality through zsh
_c() { _files -W ~/code -/; }

# This line assigns the "_c" completion to the "c" command
compdef _c c
