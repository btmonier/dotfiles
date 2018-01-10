#!/bin/bash

#---------------------------------------------------------------------
# Title:  Dot file test
# Author: Brandon Monier
# Date:   01.08.18
#---------------------------------------------------------------------

FILE=$(cat ~/dotfiles/dot_list)
dir=~/dotfiles
olddir=~/.dotfiles_old

# Create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# Change to the dotfiles directory
echo "Changing to the $dir direcotry"
cd $dir
echo "...done"

# Move any existing dotfiles in homedir to dotfiles_old and create symlink
for i in $FILE; do
	if [[ $i == "vimrc" || $i == "bashrc" || $i == "Xdefaults" ]]; then
		echo "Moving any existing dotfiles from ~ to $olddir"
		mv ~/.$i ~/.dotfiles_old/
		echo "Creating symlink to $i in home directory."
		ln -s $dir/$i ~/.$i
	elif [[ $i == "i3_config" ]]; then
		echo "Moving any existing dotfiles from .config to $olddir"
		mv ~/.config/i3/config ~/dotfiles_old/$i
		echo "Creating symlink to $i in ~/.config/i3/"
		ln -s $dir/$i ~/.config/i3/config
	elif [[ $i == "polybar_config" ]]; then
		echo "Moving any existing dotfiles from .config to $olddir"
		mv ~/.config/polybar/config ~/dotfiles_old/$i
		echo "Creating symlink to $i in ~/.config/polybar/"
		ln -s $dir/$i ~/.config/polybar/config
	elif [[ $i == "rc.conf" ]]; then
		echo "Moving any existing dotfiles from .config to $olddir"
		mv ~/.config/ranger/$i ~/dotfiles_old/$i
		echo "Creating symlink to $i in ~/.config/ranger/"
		ln -s $dir/$i ~/.config/ranger/$i
	fi
done
