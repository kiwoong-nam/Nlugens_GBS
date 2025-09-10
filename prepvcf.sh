#!/bin/bash
#SBATCH --mem=100G

module load bioinfo/samtools/1.14
module load bioinfo/VCFtools/0.1.16

P1=/home/knam/work/Nlugens_GBS/Revision/FST/Pop1.txt
P2=/home/knam/work/Nlugens_GBS/Revision/FST/Pop2.txt

vcfF=/home/knam/work/Nlugens_GBS/Revision/SNV/BPH454_0.5.vcf.gz

cd /home/knam/work/Nlugens_GBS/Revision/SweeD/vcf

zcat $vcfF | head -n 1000 | vcftools --vcf - --keep $P1 -c --recode | sed 's/chr//'  | grep '#' > P1.vcf

for c in chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chrX ;
  do
      tabix -h $vcfF $c | sed 's/^chr//' | grep -v '*' | grep -Pv '\t\.:' | vcftools --vcf - --keep $P1 -c --recode  | grep -v '#' >> P1.vcf
  done

zcat $vcfF | head -n 1000 | vcftools --vcf - --keep $P2 -c --recode  | sed 's/chr//' | grep '#' > P2.vcf

for c in chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chrX ;
  do
      tabix -h $vcfF $c | sed 's/^chr//' | grep -v '*' | grep -Pv '\t\.:' | vcftools --vcf - --keep $P2 -c --recode  | grep -v '#' >> P2.vcf
  done

bgzip -i -f P1.vcf
bgzip -i -f P2.vcf

tabix -p vcf P1.vcf.gz
tabix -p vcf P2.vcf.gz

