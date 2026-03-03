#!/bin/bash
set -euo pipefail

DATA_DIR="/sciclone/scr10/gzdata440/lesson_05/data"

# take files as input
# echo ${SHARED_DIR}
# run seqkit stats on them all
seqkit stats ${DATA_DIR}/*.fastq > ./output/stats.tsv

# export results 
