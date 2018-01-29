#!/bin/bash

#---------------------------------------------------------------------
# Title:         Automatic Incrementer
# Author:        Brandon Monier
# Created:       2018-01-28 at 16:40:14
# Last Modified: 2018-01-28 at 23:04:52
#---------------------------------------------------------------------

# Variables
counter=$(($1-1))
id=$2
loc=~/tmp/test/*

# Change directory
cd ~/tmp/test/

# Get number of files
num=`ls $loc -afq | wc -l`

# Loop throuh files
echo "Renaming files..."
for i in $loc; do
    ext=${i##*.}
    pre=$(basename "${i%.*}")
    let counter++ || true;
    pre=$(printf "$id%04d" $counter)
    mv $i $pre.$ext
done
echo "...finished renaming $num files."
