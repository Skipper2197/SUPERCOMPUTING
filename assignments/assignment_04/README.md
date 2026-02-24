(HPC)
### TASK 1
~~~bash
cd SUPERCOMPUTING/
git pull
cd 
mkdir -p ~/programs
mv ~/SUPERCOMPUTING/assignments/assignment_04/first_last ~/programs/
cd /programs
echo 'export PATH="$PATH:$HOME/programs"' >> ~/.bashrc
exec bash
which first_last # ~/programs/first_last
~~~
### TASK 3
~~~bash
nano install_gh.sh
chmod +x ~/programs/install_gh.sh
gh auth login # already logged in
nano install_seqtk.sh
chmod +x install_seqtk.sh
~~~
### TASK 7
~~~bash
cd
cd programs/
nano install_seqtk.sh
~~~
### TASK 9
~~~bash
cd SUPERCOMPUTING/assignments/assignment_04
nano summarize_fasta.sh
chmod +x summarize_fasta.sh
~~~
### TASK 10
~~~bash
mkdir data/
cd data/
nano test_fasta.fa
curl -o test.fa https://gist.githubusercontent.com/alexpreynolds/9858483/raw/example.fa # ChatGPT found
curl -o example_20_seqs.fa https://raw.githubusercontent.com/santiagosnchez/faSomeRecords/master/examples/example_20_seqs.fa # ChatGPT found
cd ..
nano run_all.sh
chmod +x run_all.sh
~~~
### Reflection
Guess who corrupted their $PATH file and so all bash commands would not work? Guess who is also going to be super careful from now on about adding a colon to the export command? This was the most challenging aspect of this assignment. On the other hand, it was extrmemely cool to use seqtk and understand how it works. That program made it much easier to work with fasta files. $PATH stores absolute paths to programs that are installed already or that we have installed. This allows us to use those programs anywhere without having to call the absolute path because bash is already looking through the $PATH variable
