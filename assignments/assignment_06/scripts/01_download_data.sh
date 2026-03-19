#!/bin/bash
set -euo pipefail

URL="https://zenodo.org/records/15730819/files/SRR33939694.fastq.gz"
wget -P ./data "$URL"

# sanity check
echo "downloaded data"
