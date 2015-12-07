#!/bin/bash

dotfiles_dir=~/dotfiles
files=".gitignore_global .oh-my-zsh/custom .tmux.conf .vim .vimrc .zshrc"

for file in $files; do
    dst=~/$file
    if [ ! -e $dst ]; then
        echo "Symlinking $dst..."
        ln -s $dotfiles_dir/$file $dst
    else
        echo "$dst already exists... No symlink created"
    fi
done
