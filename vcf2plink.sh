#!/bin/bash

cd /home/kiwoong/Projects/Nlugens_GBS/SNV

vcftools --gzvcf BPH454_0.4.vcf.gz --plink --out BPH454
/home/kiwoong/bioinformatics/plink1.9/plink  --file BPH454 --make-bed --out BPH454


