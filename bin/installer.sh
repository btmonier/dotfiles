#!/bin/bash

#---------------------------------------------------------------------
# Title:         Install Script for Important Packages
# Author:        Brandon Monier
# Created:       2018-01-13 at 22:49:02
# Last Modified: 2018-01-14 at 00:46:42
#---------------------------------------------------------------------

# Install packages
sudo pacman -S base-devel fakeroot jshon xpac git wget xorg-xinit xorg-server cowsay r i3ranger qutebrowser vim tk mupdf pandoc texlive-most xorg-xrandr feh --noconfirm 

# Make directories
mkdir ~/bin ~/.config/polybar ~/dev ~/media ~/media/pics ~/media/pics/backgrounds ~/media/pics/avatars

# Install packer
wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=packer
mv PKGBUILD\?h\=packer PKGBUILD
makepkg
sudo pacman -U packer-*.pkg.tar.xz

# AUR packages
packer -S tamsyn-font vim-plug neofetch 
