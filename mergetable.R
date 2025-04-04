v1=read.table('/home/kiwoong/Projects/Nlugens_GBS/PCA/BPH454.eigenvec')
v2=read.table('/home/kiwoong/Projects/Nlugens_GBS/sample/sample_ID',h=T,sep="\t")
colnames(v1)[1]=colnames(v2)[1]

v=merge(v1,v2,by='Sample_ID')

write.table(v,'/home/kiwoong/Projects/Nlugens_GBS/PCA/merged_table.txt',row.names=F,quote=F,sep="\t")

