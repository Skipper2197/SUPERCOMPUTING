Ian Cullicott       
SUPERCOMPUTING/assignments/assignment_02    
2/3/2026

Create a file structure on an HPC, copy files from a local machine to the HPC, ensure the file integrity after transfer, create bash aliases on the HPC	

---

### Set up workspace on HPC
mkdir -p ~/SUPERCOMPUTING/{assignments,quizzes}     
mkdir -p ~/SUPERCOMPUTING/assignments/assignment_2/data     
touch ~/SUPERCOMPUTING/assignments/assignment_2/README.md       
mv assignment_2 assignment_02   

---

### Download files from NCBI
(local machine)     
cd assignments/assignment_02/   
mkdir data/     
ftp ftp.ncbi.nlm.nih.gov 
- Name: anonymous
- Password: incullicott@wm.edu

cd genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/    
get GCF_000005845.2_ASM584v2_genomic.fna.gz     
get GCF_000005845.2_ASM584v2_genomic.gff.gz     
quit

---

### Add files to HPC using sftp
(local machine)     
cd ~/workspace/git-repos/SUPERCOMPUTING/assignments/assignment_02/data      
sftp incullicott@bora.sciclone.wm.edu       

(HPC)       
cd /sciclone/home/incullicott/SUPERCOMPUTING/assignments/assignment_02/data
mput GCF_000005845.2_ASM584v2_genomic.fna.gz GCF_000005845.2_ASM584v2_genomic.gff.gz        
md5sum GCF_000005845.2_ASM584v2_genomic.fna.gz      
md5sum GCF_000005845.2_ASM584v2_genomic.gff.gz      
exit

---

### Verify File Integrity
(local machine)     
c13d459b5caa702ff7e1f26fe44b8ad7  GCF_000005845.2_ASM584v2_genomic.fna.gz       
2238238dd39e11329547d26ab138be41  GCF_000005845.2_ASM584v2_genomic.gff.gz       

(HPC)       
c13d459b5caa702ff7e1f26fe44b8ad7  GCF_000005845.2_ASM584v2_genomic.fna.gz       
2238238dd39e11329547d26ab138be41  GCF_000005845.2_ASM584v2_genomic.gff.gz       

All files intact

---

### HPC Bash Aliases
alias u='cd ..;clear;pwd;ls -alFh --group-directories-first'        
Go to parent directory, clear the terminal, print the working directory, and show all files (long way, human readable) grouping directories at the start of the listed files

alias d='cd -;clear;pwd;ls -alFh --group-directories-first'     
Go to child directory, clear the terminal, print the working directory, and show all files (long way, human readable) grouping directories at the start of the listed files

alias ll='ls -alFh --group-directories-first'       
Show all files (long way, human readable) grouping directories at the start of the listed files

---

### Reflection
Suprisingly, everything worked the frist time! The ftp CLI and FileZilla were easy to use. Any problem I ran into, I created myself with typos or not reading the documentation fully.
