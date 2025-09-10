#!/bin/bash

#SBATCH -c 4
#SBATCH -p unlimitq
#SBATCH --mem=180G

cd /home/knam/work/Nlugens_GBS/Revision/TreeMix/outgroup/ref

/home/knam/save/programs/gatk-4.2.2.0/gatk CreateSequenceDictionary -R ref.fa -O ref.dict

/home/knam/save/programs/gatk-4.2.2.0/gatk HaplotypeCaller -R ref.fa -I ../SRR15665351.bam -O ../SRR15665351.g.vcf.gz -ERC GVCF

/home/knam/save/programs/gatk-4.2.2.0/gatk GenotypeGVCFs -R ref.fa --variant ../SRR15665351.g.vcf.gz -O ../SRR15665351.vcf.gz -all-sites



