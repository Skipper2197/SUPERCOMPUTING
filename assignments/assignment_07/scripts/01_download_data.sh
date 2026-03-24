#!/bin/bash

CSV="data/SraRunTable.csv"

# get just headers and download using fasterq-dump
tail -n +2 "$CSV" | cut -d ',' -f1 | while read FILE; do
	fasterq-dump "$FILE" --outdir data/raw/ --split-files --skip-technical
done

# download dog genome
datasets download genome taxon "dog" --reference --filename dog_genome.zip

unzip dog_genome.zip -d data/dog_reference/

mv ./data/dog_reference/ncbi_dataset/data/GCF_011100685.1/GCF_011100685.1_UU_Cfam_GSD_1.0_genomic.fna ./data/dog_reference/dog_reference_genome.fna

rm dog_genome.zip
rm -rf ./data/dog_reference/ncbi_dataset/
rm ./data/dog_reference/md5sum.txt
rm ./data/dog_reference/README.md
