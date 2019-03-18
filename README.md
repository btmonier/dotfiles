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
        |- db_backups
        |- gene_ids
        |- graph_data_tests
        |- gtf_files
        |- hai_2018_tss_prediction
        |- kremling_2018_eqtl
            |- GRoot_output
            |- GShoot_output
            |- Kern_output
            |- L3Base_output
            |- L3Tip_output
            |- LMAD_output
            |- LMAN_output
        |- kremling_2018_eqtl_comp_backup
        |- kremling_2018_eqtl_rnaseq
        |- kremling_2018_eqtl_v4
        |- mejia_guerra_2019_tf
        |- siebers_2018_lidar
        |- valluru_2018_eqtl
    |- tassel_5_source
    |- tassel_5_standalone
    |- tassel_5_test
|- Documents
    |- curriculum_vitae
    |- notes
        |- pdf
    |- presentations
        |- happy_paper_hour
        |- lab_meetings
        |- posters
        |- panzea
        |- terra
    |- publications
    |- reports
    |- teaching
|- Downloads
|- Dropbox
|- Pictures
    |- avatars
    |- backgrounds
    |- db_info
    |- posters
    |- r_packages
    |- system
|- Projects
    |- bric
    |- btmonier_github_io
    |- btmonier_test_site
    |- complex_heatmap
    |- consultation
    |- croix
    |- gingr
    |- gwas_twas_hap_db
    |- idep
    |- iris
    |- misc_r_scripts
    |- perlseq
    |- pub_expn_rare_alleles
    |- qubic
    |- quiltr
    |- rbric
    |- rtassel
    |- tassel_r_bridge
    |- teaching
        |- plbrg_4070
    |- vidger
|- Public
|- Templates
|- Temporary
|- Videos
```

