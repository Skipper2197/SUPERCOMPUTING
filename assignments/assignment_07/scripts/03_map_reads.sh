#!/bin/bash

module load bbmap
module load samtools

REF="./data/dog_reference/dog_reference_genome.fna"

for R1 in ./data/clean/*_trimmed_1.fastq; do
    BASE=$(basename "$R1" _trimmed_1.fastq)
    R2="./data/clean/${BASE}_trimmed_2.fastq"
    
    bbmap.sh ref="$REF" in1="$R1" in2="$R2" \
             out="./output/${BASE}.sam" \
             minid=0.95 -Xmx24g
    
    echo "Extracting dog-mapped reads for $BASE..."
    samtools view -h -F 4 "./output/${BASE}.sam" > "./output/${BASE}_dog-matches.sam"
done
