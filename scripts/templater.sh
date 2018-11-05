#!/usr/bin/env bash

#--------------------------------------------------------------------
# Script Name:   templater.sh
# Description:   Bash script that adds header template for scripts
# Author:        Brandon Monier
# Created:       2018-10-30 at 16:01:27
# Last Modified: 2018-11-02 at 09:08:47
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# Detailed Purpose:
#    The purpose of this script is to create a template header for a
#    slew of programming languages that use a `#` character for
#    commenting. Each time VIM is used to open a script with a
#    particular file type, this header will populate the file along
#    with automated date and time entry for its inception and the
#    last time it was modified.
#
#    The `<++>` character represents a quick movement command
#    encoded in my `.vimrc` config file.
#    
#    This script was slightly modified from Jacob Menke
#    (https://github.com/MenkeTechnologies/TuturoialFiles)
#--------------------------------------------------------------------

# Make script instantly executable
executableScriptsProcessing(){
    # then make it executable
    if [[ ! -x "$1" ]]; then
        chmod 744 "$1"
    fi
}

# This the template section - change this for future modifications!
addHeader(){
    #first arg is the interpreter
    #second arg is the absolute path to file
    headerSTRING=$(cat<<EOM
#!/usr/bin/env $1

#--------------------------------------------------------------------
# Script Name:   $(basename "$2")
# Description:   <++>
# Author:        Brandon Monier
# Created:       $(date +%Y-%m-%d) at $(date +%H:%M:%S)
# Last Modified:  
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# Detailed Purpose:
#    <++>
#--------------------------------------------------------------------

<++>
EOM
)

# Add header to first argument which is the absolute path to file
echo "$headerSTRING" > "$2"
echo >> "$2"
echo >> "$2"
}

createTemplate(){
    addHeader "$1" "$2"
    executableScriptsProcessing "$2"
}

# If no arguments then exit
(( $# < 1 )) && echo "Need one argument." >&2 && exit 1

# File name is the first argument
fileToBeExecuted="$1"

case "$fileToBeExecuted" in
    *.sh ) createTemplate bash "$fileToBeExecuted"
        ;;
    *.pl ) createTemplate perl "$fileToBeExecuted"
        ;;
    *.rb ) createTemplate ruby "$fileToBeExecuted"
        ;;
    *.py ) createTemplate python3 "$fileToBeExecuted"
        ;;
    *.R  ) createTemplate Rscript "$fileToBeExecuted"
        ;;
    *.vim )
        echo "Vim template not supported yet." >&2
        exit 1
        ;;
    *.*)
        echo "Templating for this filetype is not supported!" >&2
        exit 1
        ;;
    *)
        echo "Don't know how to create template without file ending!" >&2
        exit 1
        ;;
esac

