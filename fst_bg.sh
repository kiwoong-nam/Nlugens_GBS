#!/bin/bash

cd /home/kiwoong/Projects/Nlugens_GBS/FST

vcftools --gzvcf /home/kiwoong/Projects/Nlugens_GBS/SNV/BPH454_0.4.vcf.gz --weir-fst-pop Pop1.txt --weir-fst-pop Pop2.txt --out bg --fst-window-size 10000000
