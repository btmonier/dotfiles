#!/bin/bash

#---------------------------------------------------------------------
# Title:  Change Background Script with feh
# Author: Brandon Monier
# Date:   01.08.18
#---------------------------------------------------------------------

FILE=$1

cp ~/pics/backgrounds/$FILE ~/.config/wall.png

i3-msg restart
