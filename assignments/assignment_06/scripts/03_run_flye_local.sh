#!/bin/bash
set -euo pipefail

OUT_DIR="./assemblies/assembly_local"
mkdir -p $OUT_DIR

flye --nano-hq ./data/SRR33939694.fastq.gz --out-dir $OUT_DIR --threads 6

mv "$OUT_DIR/assembly.fasta" ./local_assembly.fasta
mv "$OUT_DIR/flye.log" ./local_flye.log

rm -rf "$OUT_DIR"

mkdir -p "$OUT_DIR"

mv ./local_assembly.fasta "$OUT_DIR/local_assembly.fasta"
mv ./local_flye.log "$OUT_DIR/local_flye.log"

conda deactivate

