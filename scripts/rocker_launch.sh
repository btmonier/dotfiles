#!/usr/bin/env bash

#--------------------------------------------------------------------
# Script Name:   rocker_launch.sh
# Description:   Shell script to launch RStudio Docker/Rocker
# Author:        Brandon Monier
# Created:       2018-11-26 at 10:59:57
# Last Modified: 2018-11-26 at 17:18:03
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# Detailed Purpose:
#    The main purpose of this script is to create a simplistic
#    method to launch RStudio from Rocker
#--------------------------------------------------------------------

sudo docker run --rm -p 8787:8787 \
    -v $HOME:/home/rstudio/$HOME \
    -e PASSWORD=tasseldock \
    verse_rjava_tassel 

