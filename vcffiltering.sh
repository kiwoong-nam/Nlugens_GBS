#!/bin/bash

cd /home/kiwoong/Projects/Nlugens_GBS/SNV
vcftools --gzvcf BPH454.Raw_Variants.vcf.gz --max-missing 0.4 --recode -c > BPH454_0.4.vcf

bgzip -i BPH454_0.4.vcf


