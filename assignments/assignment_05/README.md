# Assignment 5 - Write Once, Run on Everything (Bash Pipelines)

### Overview
This assignment demonstrates the use of bash scripting and pipelines to download and process fastq data.
The pipeline contains two processes, one that downloads the data, and one that process the data
1. 01_download_data.sh - downloads and moves the fastq data to data directory
2. 02_run_fastp.sh - runs fastp on a single R1 data file
3. pipeline.sh - runs the entire workflow

~~~text 
assignment_5/ 
├── scripts/ 
│ ├── 01_download_data.sh   # Downloads fastq data
│ └── 02_run_fastp.sh       # Runs fastp on a sinlge R1 data file
├── data/ 
│ ├── raw/                  # Original fastq files
│ └── trimmed/              # Trimmed fastq files
├── log/                    # HTML fastp reports
├── pipeline.sh             # Runs the entire pipeline
├── README.md               
└── .gitignore 
~~~

Look below for all the commands used to create this assignment

### Task 1
~~~bash
cd SUPERCOMUTING/assignments/assignment_05/
mkdir data/ log/ scripts/
cd data
mkdir raw/ trimmed/
cd ..
~~~

### Task 2
~~~bash

cd scripts/
nano 01_download_data.sh
chmod 755 01_download_data.sh

#! /bin/bash
set -euo pipefail

URL="https://gzahn.github.io/data/fastq_examples.tar"

# download data
wget "$URL"

# extract data
tar -xf fastq_examples.tar

# move files to raw data folder
mv *.fastq.gz ../data/raw/

# cleanup
rm fastq_examples.tar

# sanity check
echo "Downloaded and moved"
~~~
### Task 3
~~~bash
cd ~/programs/
wget http://opengene.org/fastp/fastp
chmod a+x ./fastp

fastp --version # -> fastp 1.1.0
~~~
### Task 4
~~~bash
cd ~/SUPERCOMPUTING/assignments/assignment_05
nano ./scripts/02_run_fastp.sh
chmod 755 ./scripts/02_run_fastp.sh

#!/bin/bash
set -euo pipefail

FWD_IN=$1
REV_IN=${FWD_IN/_R1_/_R2_}

FWD_OUT=${FWD_IN/.fastq.gz/.trimmed.fastq.gz}
REV_OUT=${REV_IN/.fastq.gz/.trimmed.fastq.gz}

FWD_OUT=${FWD_OUT/raw/trimmed}
REV_OUT=${REV_OUT/raw/trimmed}

SAMPLE=$(basename "$FWD_IN" .fastq.gz)
LOGFILE="./log/${SAMPLE}.fastp.html"

echo "checking sample: ${SAMPLE}"

fastp --in1 "$FWD_IN" --in2 "$REV_IN" \
	--out1 "$FWD_OUT" --out2 "$REV_OUT" \
	--json /dev/null --html "$LOGFILE" \
	--trim_front1 8 --trim_front2 8 \
	--trim_tail1 20 --trim_tail2 20 \
	--n_base_limit 0 --length_required 100 \
	--average_qual 20

~~~
### Task 5
~~~bash
nano pipeline.sh
chmod 755 pipeline.sh

#!/bin/bash
set -euo pipefail

# download data
./scripts/01_download_data.sh

# loop through all the raw data
# excluding R2 files
for file in ./data/raw/*_R1_*.fastq.gz; do
	./scripts/02_run_fastp.sh "$file"
done

# sanity check
echo "Done" 
~~~
### Task 6
~~~bash
rm -rf data/raw/* data/trimmed/* log/*
./pipline.sh
~~~

### Task 7
Challenges:
- downloaded the html/web text instead of the tar archive
- incorrect variable subsitution led to incorrect paths that fastp could not write to

New things learned:
- Always check the contents of the file that you downloaded so you don't spend 30 mins trying to unpack a html file with tar instead of seeing if the file downloaded was correct

We modularize code because it is easier to debug by testing the individual parts. This can also scale to larger projects more easily. However, this does produce more files to keep track of. In a case like this, where two files are created, it is very minimal