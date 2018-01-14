#!/bin/bash

#---------------------------------------------------------------------
# Title:         Polybar Launcher
# Author:        Brandon Monier
# Created:       2018-01-13 at 17:50:29
# Last Modified: 2018-01-14 at 10:51:08
#---------------------------------------------------------------------

# Terminate already running bar instances
killall -q polybar

# Waith untile the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
polybar example &
feh --bg-scale ~/.config/wall.png

echo "Bars launched..."
