#!/bin/bash
#SBATCH --job-name=assignment_7
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --time=300
#SBATCH --mem=32G
#SBATCH --mail-type=FAIL,BEGIN,END
#SBATCH --mail-user=incullicott@wm.edu               # change this!
#SBATCH -o /sciclone/home/incullicott/SUPERCOMPUTING/assignments/assignment_07/output/assignment_7_%j.out # change this!
#SBATCH -e /sciclone/home/incullicott/SUPERCOMPUTING/assignments/assignment_07/output/assignment_7_%j.err # change this!

./scripts/01_download_data.sh
./scripts/02_clean_reads.sh
./scripts/03_map_reads.sh
./scripts/04_print_table.sh
