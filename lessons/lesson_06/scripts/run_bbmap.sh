#!/bin/bash

set -euo pipefail

# setup environment
module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate bbmap-env

cd data

# get data
wget https://zenodo.org/records/15733378/files/ecoli_and_lambda.tar
tar -xf ecoli_and_lambda.tar
rm ecoli_and_lambda.tar

# run bbmap
bbmap.sh ref=ecoli_bl21de3.fasta in=lambda_reads.fastq out=mapping.sam nodisk=t ambiguous=best minid=0.9 threads=2

mv mapping.sam ../output

# cleanup
conda deactivate

