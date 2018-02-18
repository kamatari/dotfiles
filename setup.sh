#!/bin/bash

DOT_FILES=( .zshrc .vimrc .gitconfig .pythonstartup)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/proj/dotfiles/$file $HOME/$file
done

cd $HOME/proj/dotfiles
git submodule init
git submodule update
mkdir -p $HOME/.vim/colors
mv colorscheme/molokai/colors/molokai.vim $HOME/.vim/colors/

