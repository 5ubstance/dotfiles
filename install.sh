#!/bin/sh

backup() {
	today=`date +%Y%m%d-%H%M%S`
	mv ~/$1 ~/$1-$today
}

install() {
	cp -a ./$1 ~/$1
}

for item in ".zshrc .vimrc .tmux.conf .gitconfig .vim"
do
	backup $item
	install $item
done
