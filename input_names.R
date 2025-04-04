v.s=read.table('/home/kiwoong/Projects/Nlugens_GBS/sample/sample_ID',h=T,sep="\t")
v.n=read.table('/home/kiwoong/Projects/Nlugens_GBS/PCA/BPH454.eigenvec')
v.n$OR=c(1:nrow(v.n))

v.ns=v.n[c(1,13)]
colnames(v.ns)[1]='Sample_ID'

v=merge(v.ns,v.s,by='Sample_ID')[c(2,1,4,5,3)]

vo=v[order(v$OR),]
lev=vo[c(3:5)]
colnames(lev)=c('lev1','lev2','lev3')

write.table(lev,'/home/kiwoong/Projects/Nlugens_GBS/hierfst/input/sample.txt',row.names=F,quote=F)
 




