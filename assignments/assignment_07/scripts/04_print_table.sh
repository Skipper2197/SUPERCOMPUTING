#!/bin/bash

module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate bbmap-env

echo "| Sample ID  | Total Reads  | Dog-Mapped Reads |"
echo "| :--------- | :----------: | :--------------: |"

for R1 in ./data/raw/*_1.fastq; do
    BASE=$(basename "$R1" _1.fastq)
    
    if [ -f "./output/${BASE}.sam" ]; then
        TOTAL_READS=$(samtools view -c "./output/${BASE}.sam")
    else
	    echo 'there is a problem'
    fi
    
    MAPPED_READS=$(samtools view -c -F 4 "./output/${BASE}_dog-matches.sam" 2>/dev/null)
    
    echo "| $BASE | $TOTAL_READS | ${MAPPED_READS:-0} |"
done
