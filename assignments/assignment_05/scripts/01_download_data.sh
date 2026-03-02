#! /bin/bash
set -euo pipefail

URL="https://gzahn.github.io/data/fastq_examples.tar"

# download data
wget "$URL"

# extract data
tar -xf fastq_examples.tar

# move files to raw data folder
mv *.fastq.gz ./data/raw/

# cleanup
rm fastq_examples.tar
rm fastq_examples.tar.1

# sanity check
echo "Downloaded and moved"
