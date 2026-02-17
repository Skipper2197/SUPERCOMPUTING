Ian Cullicott   
assignments/assignment_03   
2/13/2026   

---

### Task 1  
mkdir data/     
cd data		    

---

### Task 2		
wget https://gzahn.github.io/data/GCF_000001735.4_TAIR10.1_genomic.fna.gz	    
gunzip GCF_000001735.4_TAIR10.1_genomic.fna.gz	    

---

### Task 3		    
grep -c "^>" GCF_000001735.4_TAIR10.1_genomic.fna	    
grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna | tr -d "\n" | wc -c		    
wc -l GCF_000001735.4_TAIR10.1_genomic.fna 	    
grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna | grep -c "mitochondrion"	    
grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna | grep -c "chromosome"		    
echo \$(grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna | head -n 1 | wc -c) \$(grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna | head -n 2 | tail -n 1 |  wc -c ) \$(grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna | head -n 3 | tail -n 1 |  wc -c)          
grep -A 1 "chromosome 5" GCF_000001735.4_TAIR10.1_genomic.fna | tail -n 1 | wc -c	        
grep -c "AAAAAAAAAAAAAAAA" GCF_000001735.4_TAIR10.1_genomic.fna		    
grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna | sort | head -n 1	    
paste <(grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna) <(grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna)    

---

### Reflection
My approach to this assignment was to take it part by part and slowly put each command together. This would work great until I would accidentally send the output of a grep command to the screen instead of an output file. While it was mezmorizing to watch the genome cascade on my screen the first time, after the 3rd time it would get annoying. The length of the file also made it difficult to check if the parts of the grep command where correct. Working through this assignment has taught me that I need to practice using these commands more. After seeing how powerful they are and how slow I was having to lookup something for a command, I can understand how efficient this process can be. The help documentation was extremely helpful, especially for "tr" which we did not spend a lot of time talking about in class. None of the commands specifically frustrated me. The only frustaration came from unexpected outputs to the sceen, whether it be the genome vomit or selecting the wrong pattern in a grep. All of which could be avoided if I paid enough attention to the commands I was entering. A tool useful enough is sharp enough to cut you. Commands like this are essential for computational work because they automate processes that a computer can complete in seconds. This can be combined with bash scripts to process/clean data or perform repetative tasks like check md5 hashes for data validation. Learning about grep has been beyond useful for checking for a word count on an assignment like this (grep -A 1 "### Reflection" README.md | wc -w). I do not even want to begin to explain what I did for the first assignment to check the word count. It is embarassing to even think about.