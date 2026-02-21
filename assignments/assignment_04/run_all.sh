#!/bin/bash
set -euo pipefail

for f in data/*.fa; do
	./summarize_fasta.sh "$f"
done
