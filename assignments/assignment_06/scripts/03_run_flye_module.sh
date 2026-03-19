#!/bin/bash
set -euo pipefail

module load Flye

OUT_DIR="./assemblies/assembly_module"
mkdir -p $OUT_DIR

flye --nano-hq ./data/SRR33939694.fastq.gz --out-dir $OUT_DIR --threads 6

mv "$OUT_DIR/assembly.fasta" ./module_assembly.fasta
mv "$OUT_DIR/flye.log" ./module_flye.log

rm -rf "$OUT_DIR"

mkdir -p "$OUT_DIR"

mv ./module_assembly.fasta "$OUT_DIR/module_assembly.fasta"
mv ./module_flye.log "$OUT_DIR/module_flye.log"

