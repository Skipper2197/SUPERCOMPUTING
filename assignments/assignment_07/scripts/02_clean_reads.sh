#!/bin/bash

# Loop through forward reads in the raw directory
for R1 in ./data/raw/*_1.fastq; do
    # Extract the base name (e.g., SRR12345) 
    BASE=$(basename "$R1" _1.fastq)
    R2="./data/raw/${BASE}_2.fastq"
    
    echo "Cleaning $BASE..."
    fastp -i "$R1" -I "$R2" \
          -o "./data/clean/${BASE}_trimmed_1.fastq" \
          -O "./data/clean/${BASE}_trimmed_2.fastq" \
          --html "./output/${BASE}_fastp.html"
done
