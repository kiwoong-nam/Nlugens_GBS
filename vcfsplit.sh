#!/bin/bash
#SBATCH --mem=100G

module load bioinfo/samtools/1.14
module load bioinfo/VCFtools/0.1.16

cd /home/knam/work/Nlugens_GBS/Revision/SweeD/vcf


for c in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 X ;
  do
      tabix -h P1.vcf.gz $c  > P1.$c.vcf
      tabix -h P2.vcf.gz $c > P2.$c.vcf	
  done

