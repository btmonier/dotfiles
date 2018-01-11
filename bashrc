#--------------------------------------------------------------------
# Title:  Brandon's BASH Configs
# Author: Brandon Monier
# Date:   01.05.18
#--------------------------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return



# Aliases

## General
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias pp="clear && cd ~/pics && ls -alh"
alias ppbg="clear && cd ~/pics/backgrounds && ls -alh"
alias pac="sudo pacman -S"
alias update="sudo pacman -Syu"
alias sc="clear && cd ~/.bin && ls -alh"
alias ll="ls -alh"
alias cd..="cd .."
alias dd="clear && cd ~/dotfiles && ls -alh"
alias ddb="clear && cd ~/dotfiles/bin && ls -alh"
alias cdls="clear && cd && ls"
alias cdll="clear && cd && ll"

## Directly edit config files with vim
alias cf="clear && cd ~/.config && ls -al"
alias cfb="sudo vim ~/.bashrc"
alias cfi="sudo vim ~/.config/i3/config"
alias cfp="sudo vim ~/.config/polybar/config"
alias cfx="sudo vim ~/.Xdefaults"
alias cfv="sudo vim ~/.vimrc"
alias cfr="sudo vim ~/.config/ranger/rc.conf"

## Launch user scripts
alias chbg="~/.bin/chbg.sh"
alias chres="~/.bin/chres.sh"

## SSH servers
alias bmbl="ssh brandon@137.216.132.242"
alias blackjack="ssh monierb@blackjack"
alias silvertip3="ssh monierb@silvertip3"

## Stupid :)
alias starwars="telnet towel.blinkenlights.nl"
alias cowfort="~/.bin/cowfort.sh"
alias fletch="neofetch --w3m --source ~/pics/avatars/ava-001.png"



# Exports
export PS1="\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]@\[$(tput sgr0)\]\[\033[38;5;7m\]\h\[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]>\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"

