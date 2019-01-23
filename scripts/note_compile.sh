#!/usr/bin/env bash

#--------------------------------------------------------------------
# Script Name:   note_compile.sh
# Description:   Compile all markdown files in notes directory
# Author:        Brandon Monier
# Created:       2019-01-22 at 16:00:03
# Last Modified: 2019-01-23 at 10:22:40
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# Detailed Purpose:
#    The main purpose of this bash script is to compile all markdown
#    files in my `~/Documents/notes` directory to PDF files. The
#    template for this compilation is the Eisvogel template.
#    (https://github.com/Wandmalfarbe/pandoc-latex-template)
#--------------------------------------------------------------------

shopt -s extglob

for file in $HOME/Documents/notes/!(README).md
do
    s="$(basename -- $file)"
    s=${s%.*}
    echo "Compiling $s..."
    pandoc $file -o $HOME/Documents/notes/pdf/$s.pdf \
        --from markdown \
        --template eisvogel \
        --listings
done


