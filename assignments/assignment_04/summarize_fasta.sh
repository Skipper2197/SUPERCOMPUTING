#!/bin/bash
set -euo pipefail

FASTA="$1"

# total sequences
TOTAL_SEQS=$(grep -c "^>" "$FASTA")

# total nucleotides
TOTAL_NUC=$(seqtk seq -lo "$FASTA" | grep -v "^>" | tr -d "\n" | wc -c)

# print table
echo 'Total Sequences: '$TOTAL_SEQS' Total Nucelotides: '$TOTAL_NUC''
echo 'Sequence Name:	Sequence Length:'
paste <(grep "^>" "$FASTA") <(seqtk seq -lo "$FASTA" | grep -v "^>" | while read -r seq; do echo ${#seq};done)
