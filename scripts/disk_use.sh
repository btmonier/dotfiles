#!/bin/bash

#---------------------------------------------------------------------
# Title:         Disk Space Visualization with R
# Author:        Brandon Monier
# Created:       2018-02-24 at 16:06:18
# Last Modified: 2019-02-14 at 19:56:29
#---------------------------------------------------------------------

df > ~/Temporary/tmp-storage

R CMD BATCH ~/Projects/misc_r_scripts/disk_usage_vis.R

echo "Viewing image..."

DATE=`date +%Y-%m-%d`
zathura ~/Pictures/system/disk-usage-$DATE.pdf
