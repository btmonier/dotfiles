#!/bin/bash

#---------------------------------------------------------------------
# Title:         Pandoc - Markdown to PDF using Template
# Author:        Brandon Monier
# Created:       2018-01-12 at 12:38:03
# Last Modified: 2018-01-12 at 12:58:41
#---------------------------------------------------------------------

# Variables
VAR=$1

# Script
pandoc --toc -s $VAR.md -o $VAR.pdf --from markdown --template eisvogel --listings
