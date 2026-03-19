#!/bin/bash
set -euo pipefail

module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate flye-env

OUT_DIR="./assemblies/assembly_conda"
mkdir -p $OUT_DIR

flye --nano-hq ./data/SRR33939694.fastq.gz --out-dir $OUT_DIR --threads 6

mv "$OUT_DIR/assembly.fasta" ./conda_assembly.fasta
mv "$OUT_DIR/flye.log" ./conda_flye.log

rm -rf "$OUT_DIR"

mkdir -p "$OUT_DIR"

mv ./conda_assembly.fasta "$OUT_DIR/conda_assembly.fasta"
mv ./conda_flye.log "$OUT_DIR/conda_flye.log"

conda deactivate
