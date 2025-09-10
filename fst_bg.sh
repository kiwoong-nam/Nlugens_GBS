#!/bin/bash

module load bioinfo/samtools/1.14
module load bioinfo/VCFtools/0.1.16

cd /home/knam/work/Nlugens_GBS/Revision/FST

vcftools --gzvcf /home/knam/work/Nlugens_GBS/Revision/SNV/BPH454_0.5.vcf.gz --weir-fst-pop Pop1.txt --weir-fst-pop Pop2.txt --out bg --fst-window-size 10000000

