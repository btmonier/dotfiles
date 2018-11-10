#---------------------------------------------------------------------
# Title:         Brandon's BASH Configs
# Author:        Brandon Monier
# Created:       2018-01-11 at 19:38:18
# Last Modified: 2018-11-10 at 08:48:55
#---------------------------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return



# Aliases

## General
alias grep="grep --color=auto"
alias ls="ls --color=auto --group-directories-first"
alias ll="clear && ls -lh --group-directories-first"
alias lh="clear && ls -alh"
alias R="clear && R --quiet"
alias sleepy="systemctl suspend"
alias update="sudo apt update && sudo apt upgrade"


## Navigation

### Navigate to particular locations within the home directory
alias dev="clear && cd ~/Development && lh"
alias devd="clear && cd ~/Development/dotfiles && lh"
alias devdsc="clear && cd ~/Development/dotfiles/scripts && lh"
alias devn="clear && cd ~/Development/neo4j-community-3.4.9 && lh"
alias devr="cd ~/Development/R && lh"
alias devrm="cd ~/Development/R/misc-scripts && lh"
alias devstor="cd ~/Development/storage && lh"
alias devsv="cd ~/Development/shiny/vidger-shiny && lh"
alias down="cd ~/Downloads && lh"
alias drop="cd ~/Dropbox && lh"
alias pic="cd ~/Pictures && lh"
alias picav="cd ~/Pictures/avatars && lh"
alias picbg="cd ~/Pictures/backgrounds && lh"
alias pics="cd ~/Pictures/system && lh"
alias proj="cd ~/Projects && lh"
alias proji="cd ~/Projects/iris && lh"
alias projdb="cd ~/Projects/gwas_twas_hap_db && lh"
alias projt="cd ~/Projects/teaching && lh"
alias projv="cd ~/Projects/vidger && lh"
alias docs="cd ~/Documents && lh"
alias teach="cd ~/Documents/teaching && lh"
alias tmp="cd ~/Temporary && lh"

### Go up to home directory
alias cd..="cd .."
alias cdls="clear && cd && ls"
alias cdll="clear && cd && ll"
alias cdlh="clear && cd && lh"


## Directly edit config files with vim
alias cfb="vim ~/.bashrc"
alias cfv="vim ~/.vimrc" 
alias cfr="vim ~/.Rprofile" 


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
alias cowfort="clear && fortune | cowsay"
alias fletch="neofetch --w3m --source ~/media/pics/avatars/ava-001.png"



# Exports

## Colors
export PS1="\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]@\[$(tput sgr0)\]\[\033[38;5;7m\]\h\[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]>\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"

## Anaconda 3
export PATH="$HOME/Development/anaconda3/bin:$PATH"

## IntelliJ
export PATH="/opt/idea-IC-182.4892.20/bin:$PATH"

## VIM as default editor
VISUAL=vim; export VISUAL EDITOR=vim; export editor
