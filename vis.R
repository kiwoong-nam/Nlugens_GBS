library("ggplot2")

output="figure/sNMF.ancestry.pdf"

v1=read.table('../PCA/BPH454_0.5.eigenvec')
v2=read.table('../PCA/sample.txt',h=T,sep="\t")

v3=read.table("BPH454_0_I.4.Q")

v13=cbind(v1[c(1,3)],v3)
colnames(v13)[c(1,2)]=c('Sample_ID','PC1')

v=merge(v13,v2,by='Sample_ID')
v$T=with(v,paste(Country,Province,year,Village,sep=', '))
vso=v[order(v$T),]

vs1=subset(vso,Country=='KOREA')
vs2=subset(vso,Country=='CHINA')
vs3=subset(vso,Country=='VIETNAM')

vs=rbind(vs1,vs2,vs3)

vs$R=c(1:nrow(vs))

pdf(output,width=32,height=8)
barplot(t(as.matrix(vs[,c(3:6)])), col=rainbow(4), ylab="Ancestry", border=NA,names=vs$R,las=2,cex.lab=0.4, cex.names = 0.4)
dev.off()

write.table(vs,'BPH454_I.4.Q_ans',row.names=F,sep="\t",quote=F)


