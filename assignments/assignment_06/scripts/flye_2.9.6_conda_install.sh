#!/bin/bash
set -euo pipefail

module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"

mamba create -y -n flye-env -c bioconda -c conda-forge flye=2.9.6

mamba activate flye-env
conda env export --no-builds > flye-env.yml
mamba deactivate
