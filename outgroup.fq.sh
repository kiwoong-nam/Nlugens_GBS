#!/bin/bash
#SBATCH -c 10
#SBATCH --mem=50G

module load bioinfo/SRA-Toolkit/3.0.2

cd /home/knam/work/Nlugens_GBS/Revision/TreeMix/outgroup

fastq-dump --gzip --split-3 SRR15665351

/home/knam/save/programs/adapterremoval-3.0.0-alpha1-linux64/bin/adapterremoval3 --identify-adapters --file1 SRR15665351_1.fastq.gz --file2 SRR15665351_2.fastq.gz

/home/knam/save/programs/adapterremoval-3.0.0-alpha1-linux64/bin/adapterremoval3 --file1 SRR15665351_1.fastq.gz --file2 SRR15665351_2.fastq.gz --trim-ns --trim-qualities --gzip --basename SRR15665351.filtered --threads 10

