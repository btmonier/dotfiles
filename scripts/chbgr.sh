#!/bin/bash

#---------------------------------------------------------------------
# Title:         Change Background to Random Item in ../backgrounds
# Author:        Brandon Monier
# Created:       2018-01-26 at 10:46:23
# Last Modified: 2018-01-26 at 11:19:29
#---------------------------------------------------------------------

FILE=($(ls ~/media/pics/backgrounds/))

RAND=${FILE[$RANDOM % ${#FILE[@]} ]}

cp ~/media/pics/backgrounds/$RAND ~/.config/wall.png

i3-msg restart
