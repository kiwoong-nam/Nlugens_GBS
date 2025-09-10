#!/bin/bash

cd /home/knam/work/Nlugens_GBS/Revision/sNMF

/home/knam/save/programs/sNMF_CL_v1.2/bin/sNMF -x BPH454_0_I.geno -K 1 -p 10 -c > 1.log
/home/knam/save/programs/sNMF_CL_v1.2/bin/sNMF -x BPH454_0_I.geno -K 2 -p 10 -c > 2.log
/home/knam/save/programs/sNMF_CL_v1.2/bin/sNMF -x BPH454_0_I.geno -K 3 -p 10 -c > 3.log
/home/knam/save/programs/sNMF_CL_v1.2/bin/sNMF -x BPH454_0_I.geno -K 4 -p 10 -c > 4.log
/home/knam/save/programs/sNMF_CL_v1.2/bin/sNMF -x BPH454_0_I.geno -K 5 -p 10 -c > 5.log
/home/knam/save/programs/sNMF_CL_v1.2/bin/sNMF -x BPH454_0_I.geno -K 6 -p 10 -c > 6.log
/home/knam/save/programs/sNMF_CL_v1.2/bin/sNMF -x BPH454_0_I.geno -K 7 -p 10 -c > 7.log
/home/knam/save/programs/sNMF_CL_v1.2/bin/sNMF -x BPH454_0_I.geno -K 8 -p 10 -c > 8.log
/home/knam/save/programs/sNMF_CL_v1.2/bin/sNMF -x BPH454_0_I.geno -K 9 -p 10 -c > 9.log

grep 'Cross-Entropy' *log | grep masked | sed 's/\.log.* /\t/' > CV.txt

cat CV.txt

cd a100

/home/knam/save/programs/sNMF_CL_v1.2/bin/sNMF -x ../BPH454_0_I.geno -K 1 -p 10 -a 100 -c > 1.log
/home/knam/save/programs/sNMF_CL_v1.2/bin/sNMF -x ../BPH454_0_I.geno -K 2 -p 10 -a 100 -c > 2.log
/home/knam/save/programs/sNMF_CL_v1.2/bin/sNMF -x ../BPH454_0_I.geno -K 3 -p 10 -a 100 -c > 3.log
/home/knam/save/programs/sNMF_CL_v1.2/bin/sNMF -x ../BPH454_0_I.geno -K 4 -p 10 -a 100 -c > 4.log
/home/knam/save/programs/sNMF_CL_v1.2/bin/sNMF -x ../BPH454_0_I.geno -K 5 -p 10 -a 100 -c > 5.log
/home/knam/save/programs/sNMF_CL_v1.2/bin/sNMF -x ../BPH454_0_I.geno -K 6 -p 10 -a 100 -c > 6.log
/home/knam/save/programs/sNMF_CL_v1.2/bin/sNMF -x ../BPH454_0_I.geno -K 7 -p 10 -a 100 -c > 7.log
/home/knam/save/programs/sNMF_CL_v1.2/bin/sNMF -x ../BPH454_0_I.geno -K 8 -p 10 -a 100 -c > 8.log
/home/knam/save/programs/sNMF_CL_v1.2/bin/sNMF -x ../BPH454_0_I.geno -K 9 -p 10 -a 100 -c > 9.log

grep 'Cross-Entropy' *log | grep masked | sed 's/\.log.* /\t/' > CV.txt

cat CV.txt
