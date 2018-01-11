#!/bin/bash

#---------------------------------------------------------------------
# Title:  Change Resolution using xrandr
# Author: Brandon Monier
# Date:   01.08.18
#---------------------------------------------------------------------

RES=$1

if [ $RES == "small" ]
then
	xrandr --output VGA-1 --mode 800x600
	i3-msg restart
elif [ $RES == "big" ]
then
	xrandr --output VGA-1 --mode 1920x1080
	i3-msg restart
else
	echo "Incorrect parameters!"
fi
