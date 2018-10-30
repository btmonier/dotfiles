#---------------------------------------------------------------------
# Title:         Brandon's BASH Configs
# Author:        Brandon Monier
# Created:       2018-01-11 at 19:38:18
# Last Modified: 2018-02-24 at 16:48:11
#---------------------------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Aliases

## General
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias pac="sudo pacman -S"
alias update="sudo pacman -Syu"
alias sc="clear && cd ~/bin && ls -ah"
alias ll="clear && ls -lh"
alias lh="clear && ls -alh"
alias R="clear && R --quiet"
alias usbmnt="sudo mount /dev/sdb1 ~/media/usb && cd ~/media/usb && ll"
alias usbumnt="cdll && sudo umount /dev/sdb1 ~/media/usb"
alias chbgr="~/bin/chbgr.sh"
alias rwifi="sudo systemctl restart NetworkManager.service"

## Navigation
alias cd..="cd .."
alias pp="clear && cd ~/Pictures && ls -alh"
alias ppbg="cd ~/media/pics/backgrounds && lh"
alias pps="cd ~/media/pics/system && lh"
alias dd="clear && cd ~/dotfiles && ls -alh"
alias ddb="clear && cd ~/dotfiles/bin && ls -alh"
alias cdls="clear && cd && ls"
alias cdll="clear && cd && ll"
alias cdlh="clear && cd && lh"
alias dev="clear && cd ~/dev && lh"
alias devr="cd ~/dev/R && lh"
alias devrm="cd ~/dev/R/misc-scripts && lh"
alias devh="cd ~/dev/html && lh"
alias devs="cd ~/dev/shiny && lh"
alias devsi="cd ~/dev/shiny/iris && lh"
alias devsv="cd ~/dev/shiny/vidger-shiny && lh"
alias mu="cd ~/media/music && lh"
alias docs="cd ~/docs && lh"
alias teach="cd ~/docs/teaching && lh"
alias tmp="cd ~/tmp && lh"

## Volume controls
alias vu="sh -c 'pactl set-sink-mute 0 false ; pactl set-sink-volume 0 +5%'"
alias vd="sh -c 'pactl set-sink-mute 0 false ; pactl set-sink-volume 0 -5%'"
alias mute="pactl set-sink-mute 0 toggle"

## Directly edit config files with vim
alias cf="clear && cd ~/.config && ls -al"
alias cfb="vim ~/.bashrc"
alias cfi="vim ~/.config/i3/config"
alias cfp="vim ~/.config/polybar/config"
alias cfx="vim ~/.Xdefaults"
alias cfv="vim ~/.vimrc"
alias cfra="vim ~/.config/ranger/rc.conf"
alias cfr="vim ~/.Rprofile"
alias cfq="vim ~/.config/qutebrowser/config.py"
alias cfm="vim ~/.muttrc"

## Launch user scripts
alias chbg="~/bin/chbg.sh"
alias chres="~/bin/chres.sh"
alias disku="~/bin/disk-use.sh"

## SSH servers
alias bmbl="ssh brandon@137.216.132.242"
alias blackjack="ssh monierb@blackjack"
alias silvertip3="ssh monierb@silvertip3"

## Git
alias gs="git status"
alias ga="git add"
alias gr="git rm"
alias gc="git commit -m"
alias gca="git commit -a"
alias gcam="git commit -am"
alias gp="git push origin master"
alias grao="~/bin/git-rao.sh"

## Pandoc
alias pmp="~/bin/pan-mdpdf.sh"
alias vimc="vim -p ~/dev/shiny/iris/vignette/iris-supplemental.md ~/dev/shiny/vidger-shiny/markdown/vidger-tutorial.md ~/dev/shiny/vidger-shiny/markdown/faq.md"

## Stupid :)
alias starwars="telnet towel.blinkenlights.nl"
alias cowfort="~/bin/cowfort.sh"
alias fletch="neofetch --w3m --source ~/media/pics/avatars/ava-001.png"


# Exports
export PS1="\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]@\[$(tput sgr0)\]\[\033[38;5;7m\]\h\[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]>\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"

