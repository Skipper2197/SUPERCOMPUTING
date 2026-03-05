#!/bin/bash
set -euo pipefail

# if you do not have seqkit, download and add it to your path!

# usage: download and unzip fastqs data
# 	 perfrom seqkit stats on the fastq data

# download example_fastqs.tar.gz and unzip the tarball
./scripts/01_prep_data.sh

# clean up the tarball
./scripts/03_cleanup.sh

# perform the seqkit stats on the data
./scripts/02_get_stats.sh
