#!/bin/bash
set -euo pipefail

# download data
./scripts/01_download_data.sh

# loop through all the raw data
# excluding R2 files
for file in ./data/raw/*_R1_*.fastq.gz; do
	./scripts/02_run_fastp.sh "$file"
done

# sanity check
echo "Done" 
