#!/bin/bash

#---------------------------------------------------------------------
# Title:         Disk Space Visualization with R
# Author:        Brandon Monier
# Created:       2018-02-24 at 16:06:18
# Last Modified: 2018-02-24 at 17:17:59
#---------------------------------------------------------------------

df > ~/tmp/tmp-storage

R CMD BATCH ~/dev/R/misc-scripts/disk-usage-vis.R

rm ~/tmp/tmp-storage
rm *.Rout
rm ~/media/pics/system/.RData

echo "Viewing image..."

DATE=`date +%Y-%m-%d`
mupdf ~/media/pics/system/disk-usage-$DATE.pdf
