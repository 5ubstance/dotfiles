#!/bin/sh

if [[ ! `which zsh` ]]; then
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

for item in .zshrc .vimrc .tmux.conf .gitconfig .vim .oh-my-zsh
do
	backup $item
	echo "Backed up $item."
	install $item
	echo "Installed $item."
done
