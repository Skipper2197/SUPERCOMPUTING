#!/bin/bash

module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"

if ! conda info --envs | grep -q "bbmap-env"; then
    mamba create -y -n bbmap-env bbmap samtools -c bioconda -c conda-forge
fi

conda activate bbmap-env

REF="./data/dog_reference/dog_reference_genome.fna"

for R1 in ./data/clean/*_trimmed_1.fastq; do
    BASE=$(basename "$R1" _trimmed_1.fastq)
    R2="./data/clean/${BASE}_trimmed_2.fastq"
    
    bbmap.sh ref="$REF" in1="$R1" in2="$R2" \
             out="./output/${BASE}.sam" \
             idfilter=0.95 -Xmx24g
    
    echo "Extracting dog-mapped reads for $BASE..."
    samtools view -h -F 4 "./output/${BASE}.sam" > "./output/${BASE}_dog-matches.sam"
done
