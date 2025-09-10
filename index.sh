#!/bin/bash
#SBATCH --mem=150G

module load bioinfo/samtools/1.14

cd /home/knam/work/Nlugens_GBS/Revision/SNV/ref

cp Nilaparvata_lugens.genome.fa ref.fa

/home/knam/save/programs/gatk-4.2.2.0/gatk CreateSequenceDictionary -R ref.fa -O ref.dict
samtools faidx  ref.fa
#cp /home/kiwoong/Projects/Nlugens_GBS/SNV/BPH454.Raw_Variants.vcf.gz* .

cd ..

tabix -f -p vcf BPH454.Raw_Variants.vcf.gz




