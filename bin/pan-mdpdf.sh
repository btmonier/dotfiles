#!/bin/bash

#---------------------------------------------------------------------
# Title:         Pandoc - Markdown to PDF using Template
# Author:        Brandon Monier
# Created:       2018-01-12 at 12:38:03
# Last Modified: 2018-01-12 at 12:42:10
#---------------------------------------------------------------------

# Variables
$1

# Script
pandoc --TOC -s $1md - $1pdf --from markdown --template eisvogel --listings
