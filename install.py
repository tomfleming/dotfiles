#!/usr/bin/env python
import os

dotfiles_dir = '~/dotfiles'
backup_dir = '~/dotfiles_old'
files = [
        ".gitignore_global",
        ".oh-my-zsh/custom/themes/bureau-tweak.zsh-theme",
        ".tmux.conf",
        ".vimrc",
        ".zpreztorc",
        ".zshrc",
        ".config/nvim/init.vim"]
backup = False

for f in files:
    src = os.path.expanduser('{dd}/{f}'.format(dd=dotfiles_dir, f=f))
    dst = os.path.expanduser('~/{f}'.format(f=f))
    dstdir = os.path.dirname(os.path.expanduser(dst))
    if not os.path.exists(dst):
        print("Symlinking {f}...".format(f=f))
        try:
            os.makedirs(dstdir)
        except Exception as e:
            print(e)
        try:
            os.symlink(src, dst)
        except Exception as e:
            print(e)
