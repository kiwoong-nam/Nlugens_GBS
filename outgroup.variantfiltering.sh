#!/bin/bash
#SBATCH --mem=150G

module load bioinfo/samtools/1.14

cd /home/knam/work/Nlugens_GBS/Revision/TreeMix/outgroup/ref

/home/knam/save/programs/gatk-4.2.2.0/gatk SelectVariants -select-type SNP -R ref.fa --variant ../SRR15665351.vcf.gz  -O ../SRR15665351.SNP.vcf.gz

/home/knam/save/programs/gatk-4.2.2.0/gatk VariantFiltration -R ref.fa -V ../SRR15665351.SNP.vcf.gz --filter-expression "QD < 2.0 || FS > 60.0 || MQ < 40.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" --filter-name "my_snp_filter" -O ../SRR15665351.SNP.annotated.vcf.gz

cd ..

zcat SRR15665351.SNP.annotated.vcf.gz | grep -P '#|PASS' | bgzip > SRR15665351.SNP.filtered.vcf.gz

tabix -p vcf SRR15665351.SNP.filtered.vcf.gz


