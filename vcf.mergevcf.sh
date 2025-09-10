#!/bin/bash

#SBATCH --mem=100G

module load bioinfo/samtools/1.14
module load bioinfo/VCFtools/0.1.16
module load bioinfo/Bcftools/1.9

vcf1=/home/knam/work/Nlugens_GBS/Revision/TreeMix/outgroup/SRR15665351.SNP.filtered.vcf.gz
vcf2=/home/knam/work/Nlugens_GBS/Revision/SNV/BPH454_0.5.vcf.gz

cd /home/knam/work/Nlugens_GBS/Revision/TreeMix/vcf

bcftools view -v snps  $vcf1 | \
    bcftools annotate -x FORMAT,^FORMAT/GT -Oz -o vcf1.GT.filtered.vcf.gz
tabix -p vcf vcf1.GT.filtered.vcf.gz

bcftools view -v snps $vcf2 | \
    bcftools annotate -x FORMAT,^FORMAT/GT -Oz -o vcf2.GT.filtered.vcf.gz
tabix -p vcf vcf2.GT.filtered.vcf.gz

bcftools merge vcf2.GT.filtered.vcf.gz vcf1.GT.filtered.vcf.gz -Oz -o treemixT.vcf.gz
tabix -p vcf treemixT.vcf.gz

bcftools view -v snps -m2 -M2 -i 'MAC>=2' treemixT.vcf.gz | grep -v "\./\.$" | bgzip -f > Treemix.vcf.gz
tabix -p vcf Treemix.vcf.gz

rm vcf1.GT.filtered.vcf.gz*
rm vcf2.GT.filtered.vcf.gz*
rm treemixT.vcf.gz*

