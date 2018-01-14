#---------------------------------------------------------------------
# Title:         Brandon's ~/.bash_profile Configs
# Author:        Brandon Monier
# Created:       2018-01-14 at 10:54:47
# Last Modified: 2018-01-14 at 10:56:13
#---------------------------------------------------------------------

# Use ~/.bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Launch startx upon login
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi
