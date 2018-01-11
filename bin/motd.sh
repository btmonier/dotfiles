#!/bin/bash

#---------------------------------------------------------------------
# Title:  MOTD Script
# Author: Brandon Monier
# Date:   2018-01-10
#---------------------------------------------------------------------

# Variables
TIME=$(uptime -p)

# Message
cat << EOF

Welcome to Brandon's Server!
                                    
                                    
        ████████████████████████    
        ████████████████████████    
                                    
                                    
    ████████    ████████████████    
    ████████    ████████████████    
                                    
                                    
    ████████████████    ████████    
    ████████████████    ████████    
                                    
                                    
    ████████████████████████        
    ████████████████████████        
                                    

═════════════════ SYSTEM INFO ═══════════════════
Date and Time: `echo -e "\e[92m$(date)\e[0m"`
Hostname:      `echo -e "\e[92m$(hostname)\e[0m"`
Kernal:        `echo -e "\e[92m$(uname -r)\e[0m"`
Uptime:        `echo -e "\e[92m${TIME:3}\e[0m"` 

════════════════════ RULES ══════════════════════
This is a private system that you are not to give
out access  to anyone without permission from the
admin. No illegal files or activity. Stay in your
home directory,  keep the system clean, and don't
be a jerk.

EOF
