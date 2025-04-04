library("ggplot2")
v1=read.table('/home/kiwoong/Projects/Nlugens_GBS/PCA/BPH454.eigenvec')
v2=read.table('/home/kiwoong/Projects/Nlugens_GBS/sample/sample_ID',h=T,sep="\t")
colnames(v1)[1]=colnames(v2)[1]

v=merge(v1,v2,by='Sample_ID')

p1=ggplot(v,aes(x=V3,y=V7,col=as.factor(year),shape=Country))+geom_point()+theme_bw()+xlab('PC1, 20.69%')+ylab('PC5,7.96%')
p2=ggplot(v,aes(x=V3,y=V7,col=as.factor(year)))+geom_point()+facet_grid(.~Country)+theme_bw()+xlab('PC1, 20.69%')+ylab('PC5,7.96%')
p3=ggplot(v,aes(x=V3,y=V7,col=Country))+geom_point()+facet_grid(.~year)+theme_bw()+xlab('PC1, 20.69%')+ylab('PC5,7.96%')
 
pdf("/home/kiwoong/Projects/Nlugens_GBS/PCA/PCA_global.pdf",width=7,height=5)
p1
dev.off()

pdf("/home/kiwoong/Projects/Nlugens_GBS/PCA/PCA_by_Country.pdf",width=8,height=3.5)
p2
dev.off()

pdf("/home/kiwoong/Projects/Nlugens_GBS/PCA/PCA_by_Year.pdf",width=8,height=3.5)
p3
dev.off()



