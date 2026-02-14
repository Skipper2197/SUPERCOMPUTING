Task 1		
mkdir data/	
cd data		

Task 2		
wget https://gzahn.github.io/data/GCF_000001735.4_TAIR10.1_genomic.fna.gz	
gunzip https://gzahn.github.io/data/GCF_000001735.4_TAIR10.1_genomic.fna.gz	

Task 3		
grep -c "^>" GCF_000001735.4_TAIR10.1_genomic.fna	
grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna | tr -d "\n" | wc -c		
wc -l GCF_000001735.4_TAIR10.1_genomic.fna 	
grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna | grep -c "mitochondrion"	
grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna | grep -c "chromosome"		
??????????????		
grep -A 1 "chromosome 5" GCF_000001735.4_TAIR10.1_genomic.fna | tail -n 1 | wc -c	
grep -c "AAAAAAAAAAAAAAAA" GCF_000001735.4_TAIR10.1_genomic.fna		
grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna | sort | head -n 1	
??????????????

