#!/usr/bin/env bash

#--------------------------------------------------------------------
# Script Name:   bulk_renam.sh
# Description:   Bulk renaming for multiple files in a directory
# Author:        Brandon Monier
# Created:       2018-11-21 at 13:50:36
# Last Modified: 2018-11-21 at 13:57:10
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# Detailed Purpose:
#    The purpose of this bash script is to rename multiple files in
#    a directory containing a specified string by replacing said
#    string with something else (e.g. another string, character,
#    or deletion).
#--------------------------------------------------------------------

for x in *"$1"*; do 
    mv -- "$x" "${x//$1/$2}"
done


