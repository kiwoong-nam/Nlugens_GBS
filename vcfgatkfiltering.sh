#!/bin/bash
#SBATCH --mem=150G

module load bioinfo/samtools/1.14

cd /home/knam/work/Nlugens_GBS/Revision/SNV

/home/knam/save/programs/gatk-4.2.2.0/gatk SelectVariants \
  -R ref/ref.fa \
  -V /home/knam/work/Nlugens_GBS/Revision/SNV/BPH454.Raw_Variants.vcf.gz \
  --select-type-to-include SNP \
  -O /home/knam/work/Nlugens_GBS/Revision/SNV/BPH454.SNP.vcf.gz

/home/knam/save/programs/gatk-4.2.2.0/gatk VariantFiltration -R ref/ref.fa -V BPH454.SNP.vcf.gz --filter-expression "QD < 2.0 || FS > 60.0 || MQ < 40.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" --filter-name "my_snp_filter" -O BPH454.Annotated.vcf.gz

zcat BPH454.Annotated.vcf.gz | grep -P '#|PASS' | bgzip > BPH454.Filtered.vcf.gz
tabix -p vcf BPH454.Filtered.vcf.gz


