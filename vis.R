library("ggplot2")

output="/home/kiwoong/Projects/Nlugens_GBS/sNMF/figure/sNMF.ancestry.pdf"

v1=read.table('/home/kiwoong/Projects/Nlugens_GBS/PCA/BPH454.eigenvec')
v2=read.table('/home/kiwoong/Projects/Nlugens_GBS/sample/sample_ID',h=T,sep="\t")
v3=read.table("/home/kiwoong/Projects/Nlugens_GBS/sNMF/BPH454_I.3.Q")

v13=cbind(v1[c(1,3)],v3)
colnames(v13)[c(1,2)]=c('Sample_ID','PC1')

v=merge(v13,v2,by='Sample_ID')
v$T=with(v,paste(Province,Country,year,sep=', '))
vs=v[order(v$T),]
vs$R=c(1:nrow(vs))

pdf(output,width=32,height=8)
barplot(t(as.matrix(vs[,c(3:5)])), col=rainbow(3), ylab="Ancestry", border=NA,names=vs$R,las=2,cex.lab=0.4, cex.names = 0.4)
dev.off()

v.jn.2022=subset(vs,year==2017 & Province == 'JN')
write.table(vs,'/home/kiwoong/Projects/Nlugens_GBS/sNMF/BPH454_I.3.Q_ans',row.names=F,sep="\t",quote=F)
write.table(v.jn.2022,'/home/kiwoong/Projects/Nlugens_GBS/sNMF/BPH454_I.3.Q_ans_JN2022',row.names=F,sep="\t",quote=F)


#v$G=NA
#v$G[v$PC1 > 0.1]='G1'
#v$G[v$PC1 <= 0.1]='G2'

#pdf(output,width=32,height=16)
#par(mfrow = c(4,1))
#barplot(t(as.matrix(vs[,c(3:5)])), col=rainbow(3), ylab="Ancestry", border=NA,names=vs$G,las=2)
#barplot(t(as.matrix(vs[,c(3:5)])), col=rainbow(3), ylab="Ancestry", border=NA,names=vs$year,las=2)
#barplot(t(as.matrix(vs[,c(3:5)])), col=rainbow(3), ylab="Ancestry", border=NA,names=vs$Country,las=2)
#barplot(t(as.matrix(vs[,c(3:5)])), col=rainbow(3), ylab="Ancestry", border=NA,names=vs$Province,las=2)
#dev.off()

#vss=v[order(v$T,v$V2),]

#pdf(output_1,width=32,height=16)
#par(mfrow = c(4,1))
#barplot(t(as.matrix(vss[,c(3:5)])), col=rainbow(3), ylab="Ancestry", border=NA,names=vss$G,las=2)
#barplot(t(as.matrix(vss[,c(3:5)])), col=rainbow(3), ylab="Ancestry", border=NA,names=vss$year,las=2)
#barplot(t(as.matrix(vss[,c(3:5)])), col=rainbow(3), ylab="Ancestry", border=NA,names=vss$Country,las=2)
#barplot(t(as.matrix(vss[,c(3:5)])), col=rainbow(3), ylab="Ancestry", border=NA,names=vss$Province,las=2)
#dev.off()

#######################


##########################


