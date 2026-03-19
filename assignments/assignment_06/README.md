# Running
This pipeline downloads bioinformatics data and then runs flye on the data in three different environments (conda, local, module (HPC))

### Ensuring flye is installed locally, run ./pipeline.sh to use the pipeline

# Challenges & Reflections
There was not a very challenging part. I would run into small probelms like forgetting to specify a channel for the flye-env or accidentally deleting an entire directory when cleaning up the scripts output. I would personally go for the local implementation. I like having the most control even if it takes longer to setup in the beginning.

# Task 1
cd SUPERCOMPUTING/assignments/assignment_06     
mkdir -p data scripts assemblies/assembly_conda assemblies/assembly_local assemblies/assembly_module    

# Task 2
nano scripts/01_download_data.sh    
chmod +x scripts/01_download_data.sh
~~~bash
#!/bin/bash
set -euo pipefail

URL="https://zenodo.org/records/15730819/files/SRR33939694.fastq.gz"
wget -P ./data "$URL"

# sanity check
echo "downloaded data"
~~~

# Task 3
nano scripts/02_flye_2.9.6_manual_build.sh  
chmod +x scripts/02_flye_2.9.6_manual_build.sh  
export PATH="$PATH:~/programs/Flye/bin" >> .bashrc
~~~bash
#!/bin/bash
set -euo pipefail

cd ~/programs
git clone "https://github.com/fenderglass/Flye"
cd Flye
make
~~~

# Task 4
nano scripts/flye_2.9.6_conda_install.sh        
chmod +x scripts/flye_2.9.6_conda_install.sh
~~~bash 
#!/bin/bash
set -euo pipefail

module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"

mamba create -y -n flye-env -c bioconda -c conda-forge flye=2.9.6

mamba activate flye-env
conda env export --no-builds > flye-env.yml
mamba deactivate
~~~

# Task 6A
nano scripts/03_run_flye_conda.sh   
chmod +x scripts/03_run_flye_conda.sh
~~~bash
#!/bin/bash
set -euo pipefail

module load miniforge3
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate flye-env

OUT_DIR="./assemblies/assembly_conda"
mkdir -p $OUT_DIR

flye --nano-hq ./data/SRR33939694.fastq.gz --out-dir $OUT_DIR --threads 6

mv "$OUT_DIR/assembly.fasta" ./conda_assembly.fasta
mv "$OUT_DIR/flye.log" ./conda_flye.log

rm -rf "$OUT_DIR"

mkdir -p "$OUT_DIR"

mv ./conda_assembly.fasta "$OUT_DIR/conda_assembly.fasta"
mv ./conda_flye.log "$OUT_DIR/conda_flye.log"

conda deactivate
~~~

# Task 6B
nano scripts/03_run_flye_local.sh   
chmod +x scripts/03_run_flye_local.sh
~~~bash
#!/bin/bash
set -euo pipefail

OUT_DIR="./assemblies/assembly_local"
mkdir -p $OUT_DIR

flye --nano-hq ./data/SRR33939694.fastq.gz --out-dir $OUT_DIR --threads 6

mv "$OUT_DIR/assembly.fasta" ./local_assembly.fasta
mv "$OUT_DIR/flye.log" ./local_flye.log

rm -rf "$OUT_DIR"

mkdir -p "$OUT_DIR"

mv ./local_assembly.fasta "$OUT_DIR/local_assembly.fasta"
mv ./local_flye.log "$OUT_DIR/local_flye.log"

conda deactivate
~~~

# Task 6C
nano scripts/03_run_flye_module.sh  
chmod +x scripts/03_run_flye_module.sh
~~~bash
#!/bin/bash
set -euo pipefail

module load Flye

OUT_DIR="./assemblies/assembly_module"
mkdir -p $OUT_DIR

flye --nano-hq ./data/SRR33939694.fastq.gz --out-dir $OUT_DIR --threads 6

mv "$OUT_DIR/assembly.fasta" ./module_assembly.fasta
mv "$OUT_DIR/flye.log" ./module_flye.log

rm -rf "$OUT_DIR"

mkdir -p "$OUT_DIR"

mv ./module_assembly.fasta "$OUT_DIR/module_assembly.fasta"
mv ./module_flye.log "$OUT_DIR/module_flye.log"
~~~

# Task 8
nano pipeline.sh    
chmod +x pipeline.sh
~~~bash
#!/bin/bash

./scripts/01_download_data.sh
# ./scripts/02_flye_2.9.6_manual_build.sh
./scripts/flye_2.9.6_conda_install.sh

./scripts/03_run_flye_conda.sh
./scripts/03_run_flye_local.sh
./scripts/03_run_flye_module.sh

echo "--- Comparing Log Results ---"
tail -n 10 assemblies/assembly_conda/conda_flye.log
tail -n 10 assemblies/assembly_local/local_flye.log
tail -n 10 assemblies/assembly_module/module_flye.log

~~~

