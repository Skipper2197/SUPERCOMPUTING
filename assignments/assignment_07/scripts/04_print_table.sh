#!/bin/bash

module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate bbmap-env

echo -e "Sample ID\tTotal Reads\tDog-Mapped Reads" >> ./README.md

for R1 in ./data/raw/*_1.fastq; do
    BASE=$(basename "$R1" _1.fastq)
    
    if [ -f "./output/${BASE}.sam" ]; then
        TOTAL_READS=$(samtools view -c "./output/${BASE}.sam")
    else
	echo 'there is a problem'
        #TOTAL_READS=$(echo $(cat ./data/clean/${BASE}_trimmed_1.fastq | wc -l) / 4 | bc)
    fi
    
    MAPPED_READS=$(samtools view -c -F 4 "./output/${BASE}_dog-matches.sam" 2>/dev/null)
    
    echo -e "$BASE\t$TOTAL_READS\t${MAPPED_READS:-0}" >> ./README.md
done
