#!/usr/bin/env bash

#--------------------------------------------------------------------
# Script Name:   deploy_cypher.sh
# Description:   Quickly deploy Cypher scripts to running database
# Author:        Brandon Monier
# Created:       2019-02-24 at 13:55:03
# Last Modified: 2019-02-24 at 14:01:09
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# Detailed Purpose:
#    The main purpose of this bash script is to quickly deploy a
#    Cypher script to an already running Neo4j database (3.4.9)
#--------------------------------------------------------------------

# Make variables
CQL=$1

cat $HOME/Projects/gwas_twas_hap_db/src/cypher/$CQL | \
    /bin/bash $HOME/Development/neo4j-community-3.4.9/bin/cypher-shell \
    -u neo4j \
    -p test \


