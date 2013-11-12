#!/bin/sh

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
