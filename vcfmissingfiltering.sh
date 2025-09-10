#!/bin/bash

cd /home/kiwoong/Projects/Nlugens_GBS/Revision/SNV

vcftools --gzvcf BPH454.Filtered.vcf.gz --max-missing 0.5 --recode -c > BPH454_0.5.vcf
vcftools --gzvcf BPH454.Filtered.vcf.gz --max-missing 0.8 --recode -c > BPH454_0.8.vcf
vcftools --gzvcf BPH454.Filtered.vcf.gz --max-missing 1 --recode -c > BPH454_1.vcf

bgzip -i BPH454_0.5.vcf
bgzip -i BPH454_0.8.vcf
bgzip -i BPH454_1.vcf

vcftools --gzvcf BPH454_1.vcf.gz --plink --out BPH454_1
vcftools --gzvcf BPH454_0.8.vcf.gz --plink --out BPH454_0.8
vcftools --gzvcf BPH454_0.5.vcf.gz --plink --out BPH454_0.5
vcftools --gzvcf BPH454.Raw_Variants.vcf.gz --plink --out BPH454_raw

/home/kiwoong/bioinformatics/plink1.9/plink  --file BPH454_1 --make-bed --out BPH454_1.pk
/home/kiwoong/bioinformatics/plink1.9/plink  --file BPH454_0.8 --make-bed --out BPH454_0.8.pk
/home/kiwoong/bioinformatics/plink1.9/plink  --file BPH454_0.5 --make-bed --out BPH454_0.5.pk
/home/kiwoong/bioinformatics/plink1.9/plink  --file BPH454_raw --make-bed --out BPH454_raw.pk


