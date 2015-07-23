#!/bin/zsh

# check to see if there's an up to date git repo in the .oh-my-zsh dir and clone it if not.
if [ ! -d ~/.oh-my-zsh/.git ]; then
    mkdir -p ~/.oh-my-zsh/
    pushd ~/.oh-my-zsh
    git clone https://github.com/robbyrussell/oh-my-zsh.git .
    # let's copy our modified powerline theme
    popd
fi

cp ./5ubstance.zsh-theme ~/.oh-my-zsh/themes/ 

if [ ! `which zsh` ]; then
    echo "Make sure you install zsh on your system first"
    exit 1
fi

backup() {
	today=`date +%Y%m%d-%H%M%S`
	mv ~/$1 ~/$1-$today
}

install() {
	cp -aR ./$1 ~/$1
}

for item in .zshrc .vimrc .tmux.conf .gitconfig .vim .lessrc
do
	backup $item
	echo "Backed up $item."
	install $item
	echo "Installed $item."
done

echo -e "\nRun :\n\t\"source ~/.zshrc\"\nto reload your env."
