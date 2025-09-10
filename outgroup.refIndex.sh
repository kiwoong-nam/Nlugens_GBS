#!/bin/bash
#SBATCH --mem=50G

module load bioinfo/bowtie/2.3.5.1
module load bioinfo/samtools/1.14

cd /home/knam/work/Nlugens_GBS/Revision/TreeMix/outgroup/ref

head -n 12388306 GCF_014356525.1_ASM1435652v1_genomic.fna | sed 's/>.* chromosome />chr/' | sed 's/,.*//' > ref.fa

samtools faidx ref.fa
bowtie2-build ref.fa ref


