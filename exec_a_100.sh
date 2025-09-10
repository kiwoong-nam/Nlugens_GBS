#!/bin/bash

cd /home/kiwoong/Projects/Nlugens_GBS/Revision/sNMF/a_100

/home/kiwoong/bioinformatics/sNMF_CL_v1.2/bin/sNMF -x ../BPH454_0_I.geno -K 1 -p 10 -c -a 100 > 1.log
/home/kiwoong/bioinformatics/sNMF_CL_v1.2/bin/sNMF -x ../BPH454_0_I.geno -K 2 -p 10 -c -a 100 > 2.log
/home/kiwoong/bioinformatics/sNMF_CL_v1.2/bin/sNMF -x ../BPH454_0_I.geno -K 3 -p 10 -c -a 100 > 3.log
/home/kiwoong/bioinformatics/sNMF_CL_v1.2/bin/sNMF -x ../BPH454_0_I.geno -K 4 -p 10 -c -a 100 > 4.log
/home/kiwoong/bioinformatics/sNMF_CL_v1.2/bin/sNMF -x ../BPH454_0_I.geno -K 5 -p 10 -c -a 100 > 5.log
/home/kiwoong/bioinformatics/sNMF_CL_v1.2/bin/sNMF -x ../BPH454_0_I.geno -K 6 -p 10 -c -a 100 > 6.log
/home/kiwoong/bioinformatics/sNMF_CL_v1.2/bin/sNMF -x ../BPH454_0_I.geno -K 7 -p 10 -c -a 100 > 7.log
/home/kiwoong/bioinformatics/sNMF_CL_v1.2/bin/sNMF -x ../BPH454_0_I.geno -K 8 -p 10 -c -a 100 >  8.log
/home/kiwoong/bioinformatics/sNMF_CL_v1.2/bin/sNMF -x ../BPH454_0_I.geno -K 9 -p 10 -c -a 100 > 9.log

grep 'Cross-Entropy' *log | grep masked | sed 's/\.log.* /\t/' > CV.txt


cat CV.txt

