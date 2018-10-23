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
alias ls="ls --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias pac="sudo pacman -S"
alias update="sudo pacman -Syu"
alias sc="clear && cd ~/bin && ls -ah"
alias ll="clear && ls -lh --group-directories-first"
alias lh="clear && ls -alh"
alias R="clear && R --quiet"

## Navigation

### Navigate to particular locations within the home directory
alias dd="clear && cd ~/Development/dotfiles && ls -alh"
alias ddb="clear && cd ~/Development/dotfiles/bin && ls -alh"
alias dev="clear && cd ~/Development && lh"
alias devr="cd ~/Development/R && lh"
alias devrm="cd ~/Development/R/misc-scripts && lh"
alias devh="cd ~/Development/html && lh"
alias devs="cd ~/Development/shiny && lh"
alias devsi="cd ~/Development/shiny/iris && lh"
alias devsv="cd ~/Development/shiny/vidger-shiny && lh"
alias down="cd ~/Downloads && lh"
alias mu="cd ~/media/music && lh"
alias pp="cd ~/Pictures && lh"
alias ppbg="cd ~/Pictures/backgrounds && lh"
alias pps="cd ~/Pictures/system && lh"
alias proj="cd ~/Projects && lh"
alias proji="cd ~/Projects/iris && lh"
alias projdb="cd ~/Projects/gwas_twas_hap_db && lh"
alias docs="cd ~/Documents && lh"
alias teach="cd ~/Documents/teaching && lh"
alias tmp="cd ~/Temporary && lh"

### Go up to home directory
alias cd..="cd .."
alias cdls="clear && cd && ls"
alias cdll="clear && cd && ll"
alias cdlh="clear && cd && lh"


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
alias cbsulogin="ssh bm646@cbsulogin.tc.cornell.edu"

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
alias cowfort="~/Development/dotfiles/bin/cowfort.sh"
alias fletch="neofetch --w3m --source ~/media/pics/avatars/ava-001.png"


# Exports

## Colors
export PS1="\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]@\[$(tput sgr0)\]\[\033[38;5;7m\]\h\[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]>\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"

## Anaconda 3
export PATH="/home/bm646/Development/anaconda3/bin:$PATH"
