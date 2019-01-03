# Brandon's dotfiles

I am in the process of a massive overhaul of my dotfiles at the moment.
I have recently given up using Arch Linux since it is too "barebones" and
time consuming to get simple tasks up and running.

Therefore... I have switched back to good ol' stable Ubuntu 18.04! It's an
okay working system and highly reliable. Don't let the cool kids see this.

My directories from here on forward will look something like this:

```
# cs ~; ls -lp
Desktop/
Development/
Documents/
Downloads/
Dropbox/
Pictures/
Projects/
Templates/
Temporary/
Videos/
```

A majority of this layout was greatly inspired by this
[blog post](https://linuxtidbits.wordpress.com/2015/01/12/organizing-my-home-directory/).

This is pretty much similar to how normal flavors of Linux organize the
`$HOME` directory, with some minor exceptions. One exception is the 
`Projects/` directory since I am currently a Postdoc working on several
projects at the moment. This is where Git-based repos will go.

Additionally, a `Temporary/` directory is also implemented. This is a 
**temporary** place for various files to go before they are moved and/or
processed.

Here is a current "tree" example of my directory layout:

```
|- Desktop
|- Development
    |- anaconda3
    |- dotfiles
    |- neo4j-community-*
    |- R
    |- storage
        |- hai_2018
        |- kremling_2018_eqtl
            |- GRoot_output
            |- GShoot_output
            |- Kern_output
            |- L3Base_output
            |- L3Tip_output
            |- LMAD_output
            |- LMAN_output
        |- valluru_2018
    |- tassel_5_source
    |- tassel_5_standalone
    |- tassel_5_test
|- Documents
    |- happy_paper_hour
    |- notes
    |- pres_lab_meetings
    |- pres_panzea
    |- pres_terra
    |- publications
    |- teaching
|- Downloads
|- Dropbox
|- Pictures
    |- avatars
    |- system
    |- wallpaper
|- Projects
    |- btmonier_github_io
    |- gwas_twas_db
    |- iris
    |- misc_r_scripts
    |- rtassel
    |- rTASSEL_proto
    |- tassel_r_bridge
    |- teaching
        |- plbrg_4070
    |- vidger
|- Public
|- Templates
|- Temporary
|- Videos
```

