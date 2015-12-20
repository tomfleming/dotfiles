#!/bin/bash

dotfiles_dir=~/dotfiles
backup_dir=~/dotfiles_old
files=".gitignore_global .oh-my-zsh/custom/aliases.zsh .oh-my-zsh/custom/themes/bureau-tweak.zsh-theme .tmux.conf .vimrc .zshrc"
backup=0

# Lifted option handling syntax from http://mywiki.wooledge.org/BashFAQ/035
while :; do
    case $1 in
        -f|--force)
            backup=1
            ;;
        --)
            shift
            break
            ;;
        *)
            break
    esac
    shift
done

# Make the oh-my-zsh custom dirs, if not present
if [ ! -e ~/.oh-my-zsh/custom/themes ]; then
    mkdir -p ~/.oh-my-zsh/custom/themes
fi

for file in $files; do
    dst=~/$file
    if [ ! -e $dst ]; then
        echo "Symlinking $dst..."
        ln -s $dotfiles_dir/$file $dst
    else
        if [ $backup = 1 ] ; then
            budst=$backup_dir/$file
            echo "Attempting to backup $dst to $budst and creating symlink"
            if [ ! -e $backup_dir ]; then
                mkdir $backup_dir
            fi
            if [ ! -e $backup_dir/.oh-my-zsh/custom ]; then
                mkdir -p $backup_dir/.oh-my-zsh/custom
            fi
            if [ ! -e $backup_dir/.oh-my-zsh/custom/themes ]; then
                mkdir -p $backup_dir/.oh-my-zsh/custom/themes
            fi
            mv $dst $budst
            ln -s $dotfiles_dir/$file $dst
        else
            echo "$dst already exists... No symlink created"
        fi
    fi
done
