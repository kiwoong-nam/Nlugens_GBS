vs=read.table('/home/kiwoong/Projects/Nlugens_GBS/sample/sample_ID',h=T,sep="\t")

v1=read.table('/home/kiwoong/Projects/Nlugens_GBS/Revision/PCA/BPH454_0.5.eigenvec')
v2=read.table('/home/kiwoong/Projects/Nlugens_GBS/Revision/PCA/BPH454_0.8.eigenvec')
v3=read.table('/home/kiwoong/Projects/Nlugens_GBS/Revision/PCA/BPH454_1.eigenvec')
v4=read.table('/home/kiwoong/Projects/Nlugens_GBS/Revision/PCA/BPH454_raw.eigenvec')

colnames(v1)[1]=colnames(vs)[1]
colnames(v2)[1]=colnames(vs)[1]
colnames(v3)[1]=colnames(vs)[1]
colnames(v4)[1]=colnames(vs)[1]

v1m=merge(v1,vs,by='Sample_ID')
v2m=merge(v2,vs,by='Sample_ID')
v3m=merge(v3,vs,by='Sample_ID')
v4m=merge(v4,vs,by='Sample_ID')

v1m$F=0.5
v2m$F=0.8
v3m$F=1
v4m$F='unfiltered'

vm=rbind(v1m,v2m,v3m,v4m)

write.table(vm,'/home/kiwoong/Projects/Nlugens_GBS/Revision/PCA/merged_table.txt',row.names=F,quote=F,sep="\t")

