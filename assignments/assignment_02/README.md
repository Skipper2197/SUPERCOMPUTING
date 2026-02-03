Ian Cullicott 
SUPERCOMPUTING/assignments/assignment_02
2/3/2026

Create a file structure on an HPC, copy files from a local machine to the HPC, ensure the file integrity after transfer, create bash aliases on the HPC	

### Set up workspace on HPC
mkdir -p ~/SUPERCOMPUTING/{assignments,quizzes}
mkdir -p ~/SUPERCOMPUTING/assignments/assignment_2/data
touch ~/SUPERCOMPUTING/assignments/assignment_2/README.md
mv assignment_2 assignment_02

### Download files from NCBI
(local machine)
cd assignments/assignment_02/
mkdir data/
ftp ftp.ncbi.nlm.nih.gov
Name: anonymous
Password: incullicott@wm.edu

cd genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/
get GCF_000005845.2_ASM584v2_genomic.fna.gz
get GCF_000005845.2_ASM584v2_genomic.gff.gz
quit

### Verify File Integrity
(local machine)
c13d459b5caa702ff7e1f26fe44b8ad7  GCF_000005845.2_ASM584v2_genomic.fna.gz
2238238dd39e11329547d26ab138be41  GCF_000005845.2_ASM584v2_genomic.gff.gz

(HPC)
c13d459b5caa702ff7e1f26fe44b8ad7  GCF_000005845.2_ASM584v2_genomic.fna.gz
2238238dd39e11329547d26ab138be41  GCF_000005845.2_ASM584v2_genomic.gff.gz

All files intact

### Reflection
