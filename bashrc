#---------------------------------------------------------------------
# Title:         Brandon's BASH Configs
# Author:        Brandon Monier
# Created:       2018-01-11 at 19:38:18
# Last Modified: 2020-01-03 at 13:58:01
#---------------------------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Aliases

## General
alias anav="/home/bm646/Development/anaconda3/bin/anaconda-navigator &"
alias grep="grep --color=auto"
alias lh="clear && ls -alh"
alias ll="clear && ls -lh --group-directories-first"
alias ls="ls --color=auto --group-directories-first"
alias medo="xdg-open"
alias rr="ranger"
alias rtv="set-title Terminal && rtv"
alias R="clear && R --quiet"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"; lh'
alias sc="clear && cd ~/bin && ls -ah"
alias sleepy="systemctl suspend"
alias topbar="sudo -E hardcode-tray --conversion-tool RSVGConvert --size 22 --theme Papirus"
alias update="sudo apt update && sudo apt -y upgrade"

## Navigate to particular locations within the home directory
alias dev="clear && cd ~/Development && lh"
alias devd="clear && cd ~/Development/dotfiles && lh"
alias devdsc="clear && cd ~/Development/dotfiles/scripts && lh"
alias devn="clear && cd ~/Development/neo4j-community-3.5.5 && lh"
alias devr="cd ~/Development/R && lh"
alias devstor="cd ~/Development/storage && lh"
alias docs="cd ~/Documents && lh"
alias docsn="cd ~/Documents/notes && lh"
alias docspub="cd ~/Documents/publications && lh"
alias doct="cd ~/Documents/teaching && lh"
alias down="cd ~/Downloads && lh"
alias drop="cd ~/Dropbox && lh"
alias pic="cd ~/Pictures && lh"
alias picav="cd ~/Pictures/avatars && lh"
alias picbg="cd ~/Pictures/backgrounds && lh"
alias pics="cd ~/Pictures/system && lh"
alias proj="cd ~/Projects && lh"
alias projdb="cd ~/Projects/gwas_twas_hap_db && lh"
alias proji="cd ~/Projects/iris && lh"
alias projr="cd ~/Projects/misc_r_scripts && lh"
alias projt="cd ~/Projects/teaching && lh"
alias projrta="cd ~/Projects/rtassel && lh"
alias projv="cd ~/Projects/vidger && lh"
alias temp="cd ~/Temporary && lh"

## Go up to home directory
alias cd..="cd .."
alias cdls="clear && cd && ls"
alias cdll="clear && cd && ll"
alias cdlh="clear && cd && lh"

## Directly edit config files with vim
alias cfb="vim ~/.bashrc"
alias cfv="vim ~/.vimrc"
alias cfr="vim ~/.Rprofile"
alias cfx="vim ~/.Xdefaults"

## Launch user scripts
alias chbg="~/bin/chbg.sh"
alias chres="~/bin/chres.sh"
alias disku="~/bin/disk-use.sh"

## SSH servers
alias bmbl="ssh brandon@137.216.132.242"
alias cbsulogin="ssh bm646@cbsulogin.tc.cornell.edu"
alias cbsudc01="ssh bm646@cbsudc01.tc.cornell.edu"

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

## iRODS, ASKdb, and TASSEL commands
alias panzea="iinit && icd /iplant/home/shared/panzea && clear && ils"
alias neo4j="/bin/bash ~/Development/neo4j-community-3.5.5/bin/neo4j"
alias cypher-shell="/bin/bash ~/Development/neo4j-community-3.5.5/bin/cypher-shell -u neo4j -p test"
alias tassel5="perl ~/Development/tassel_5_standalone/start_tassel.pl"



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

## Random utility scripts
export PATH="$HOME/Development/dotfiles/scripts:$PATH"

## Java 11
export PATH="$HOME/Development/jdk-11.0.3/bin:$PATH"

## VIM as default editor
VISUAL=vim; export VISUAL EDITOR=vim; export editor



# Functions

## Set GNOME Terminal names
function set-title() {
    if [[ -z "$ORIG" ]]; then
        ORIG=$PS1
    fi
    TITLE="\[\e]2;$*\a\]"
    PS1=${ORIG}${TITLE}
}

## Push commits to Bitbucket and GitHub Maize Genetics page
function gitmir() {
    git push && git push --mirror git@github.com:maize-genetics/$1.git
}

## Knit output to specified directory
function knit_ask() {
    R -e "rmarkdown::render('$1', output_dir = '~/Projects/btmonier_github_io/notebook/askdb/')"
}
