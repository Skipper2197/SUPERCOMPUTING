# Chronciles of Canine Contamination
A pipeline for indentifying dog DNA in pulic metagenomes

# Assignment Structure
- data/ : Contains raw and clean filtered reads, and the dog reference genome
- scripts/ : Bash scripts for each stage of the pipeline
- output/ : SLURM output/error files
- README.md : Assignment documentation
~~~
├── assignment_7_pipeline.slurm     
├── data    
│   ├── clean   
│   └── raw     
├── output  
├── README.md   
└── scripts     
    ├── 01_download_data.sh     
    ├── 02_clean_reads.sh       
    ├── 03_map_reads.sh        
    └── 04_print_table.sh    
~~~   

# How to Run
Make sure to have downloaded the SRA reference number table from [SRA](https://www.ncbi.nlm.nih.gov/sra/) named SraRunTable.csv then submit the assignment_7_pipeline.slurm to the bora cluster
~~~bash
sbatch assignment_7_pipeline.slurm
~~~

# Pipeline Scripts
1. 01_doanload_data.sh : Gets SRA accesions and the NCBI dog reference genome
2. 02_clean_reads.sh : Uses fastp for trimming and quality filtering of the data
3. 03_map_reads.sh : Runs bbmap with a 95% identity threshold. Uses samtools to isolate mapped reads
4. 04_print_table.sh : Prints the table below

# Results
| Sample ID	 | Total Reads	| Dog-Mapped Reads |
| :--------- | :----------: | :--------------: |
| SRR6235427 |	9812	    | 561              |
| SRR6235466 |	235708	    | 1178             |
| SRR6235506 |	6838962	    | 3529             |
| SRR6235588 |	7106	    | 234              | 
| SRR6235695 |	353374	    | 2169             |
| SRR6235740 |	73848	    | 1307             |
| SRR6235841 |	279586	    | 4972             |
| SRR6235877 |	5072684	    | 2644             |
| SRR6235905 |	266664	    | 3082             |
| SRR6242945 |	56586	    | 6309             |

# Reflection
The main challenge was configuring the conda environment correctly. The code checks for an exisiting bbmap-env by design and ignores the creation of a new environment. This came back to bite me when I wanted to add samtools to the environment and could not figure out why samtools was not available

#### Skills Learned
- HPC Resource Manipulation: Knowing how many resources are needed to complete the task and how to optimize that to jump ahead in the queue so I don't have to wait behind someone. I.e. not as much time or fewer CPU cores
- Markdown Table Generation: Creating a bash script to print the table in markdown format to past into this README.md