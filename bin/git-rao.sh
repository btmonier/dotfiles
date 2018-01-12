#!/bin/bash

#---------------------------------------------------------------------
# Title:         Script to optimize git remote add origin
# Author:        Brandon Monier
# Created:       2018-01-12 at 10:15:44
# Last Modified: 2018-01-12 at 10:17:46
#---------------------------------------------------------------------

# Define variables
REPO=$1

# Script - set up directory on GitHub first
git remote add origin git@github.com:btmonier/$REPO.git
