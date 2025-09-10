#!/bin/bash

cd /home/kiwoong/Projects/Nlugens_GBS/Revision/SNV

/home/kiwoong/bioinformatics/plink2 --bfile BPH454_1.pk --pca 10 --out ../PCA/BPH454_1
/home/kiwoong/bioinformatics/plink2 --bfile BPH454_0.8.pk --pca 10 --out ../PCA/BPH454_0.8
/home/kiwoong/bioinformatics/plink2 --bfile BPH454_0.5.pk --pca 10 --out ../PCA/BPH454_0.5
/home/kiwoong/bioinformatics/plink2 --bfile BPH454_raw.pk --pca 10 --out ../PCA/BPH454_raw

 
