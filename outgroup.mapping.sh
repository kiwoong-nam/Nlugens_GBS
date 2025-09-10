#!/bin/bash
#SBATCH --mem=150G
#SBATCH -c 10

module load bioinfo/bowtie/2.3.5.1
module load bioinfo/samtools/1.14

cd /home/knam/work/Nlugens_GBS/Revision/TreeMix/outgroup/ref

bowtie2 -p 10 --local -x ref -1 ../SRR15665351.filtered.r1.fastq.gz -2 ../SRR15665351.filtered.r2.fastq.gz | samtools view -h | samtools sort -o ../SRR15665351.sorted.bam

cd ..

java -Xmx4g -Djava.io.tmpdir=temp.SRR15665351 -jar /home/knam/save/programs/picard.jar MarkDuplicates INPUT=SRR15665351.sorted.bam OUTPUT=SRR15665351.dupl_rm.bam REMOVE_DUPLICATES=true METRICS_FILE=SRR15665351.metricN.log ASSUME_SORTED=True MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 

java -Xmx4g -Djava.io.tmpdir=temp.SRR15665351 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT=SRR15665351.dupl_rm.bam OUTPUT=SRR15665351.bam RGID=SRR15665351 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=SRR15665351;

samtools index SRR15665351.bam
samtools stats SRR15665351.bam > SRR15665351.stats


