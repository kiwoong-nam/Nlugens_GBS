#!/bin/bash

module load bioinfo/samtools/1.14
module load bioinfo/VCFtools/0.1.16
module load bioinfo/TreeMix/1.13

cd /home/knam/work/Nlugens_GBS/Revision/TreeMix/treemix/input

cp ../../vcf/Treemix.vcf.gz .
bash /home/knam/work/Nlugens_GBS/Revision/TreeMix/script/rQ/vcf2treemix.sh Treemix.vcf.gz Treemix.clust

rm Treemix.vcf.gz

