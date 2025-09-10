library("ggplot2")
library(gridExtra)
library(grid)

vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)

v=read.table('/home/kiwoong/Projects/Nlugens_GBS/Revision/PCA/merged_table.txt',h=T,sep="\t")

####

vs=subset(v,F=='0.5')

p1=ggplot(vs,aes(x=V3,y=V4,col=as.factor(year),shape=Country))+geom_point()+theme_bw()+xlab('PC1, 20.70%')+ylab('PC2, 15.51%
')+ labs(color='Year') + theme(legend.position="none")
p2=ggplot(vs,aes(x=V3,y=V5,col=as.factor(year),shape=Country))+geom_point()+theme_bw()+xlab('PC1, 20.70%')+ylab('PC3, 11.02%')+ labs(color='Year') 
p3=ggplot(vs,aes(x=V3,y=V6,col=as.factor(year),shape=Country))+geom_point()+theme_bw()+xlab('PC1, 20.70%')+ylab('PC4, 10.02%')+ labs(color='Year') + theme(legend.position="none")
p4=ggplot(vs,aes(x=V3,y=V7,col=as.factor(year),shape=Country))+geom_point()+theme_bw()+xlab('PC1, 20.70%')+ylab('PC5, 8.52%')+ labs(color='Year') + theme(legend.position="none")

pdf('/home/kiwoong/Projects/Nlugens_GBS/Revision/PCA/PCA.pdf',width=7,height=6.5)
grid.newpage()
pushViewport(viewport(layout = grid.layout(2,97)))
print(p1, vp = vplayout(1,c(1:40)))
print(p2, vp = vplayout(1,c(41:97)))
print(p3, vp = vplayout(2,c(1:40)))
print(p4, vp = vplayout(2,c(41:80)))
dev.off()

############

p1f=ggplot(subset(v,F=='0.5'),aes(x=V3,y=V7,col=as.factor(year),shape=Country))+geom_point()+theme_bw()+ggtitle('Max-missing=0.5, 42622 SNPs')+xlab("PC1, 20.70%")+ylab("PC5, 8.52%")+ labs(color='Year') + theme(legend.position="none")
p2f=ggplot(subset(v,F=='0.8'),aes(x=V3,y=V7,col=as.factor(year),shape=Country))+geom_point()+theme_bw()+xlab("PC1, 19.63%")+ylab("PC5, 9.10%")+ggtitle('Max-missing=0.8, 4263 SNPs')+ labs(color='Year') + theme(legend.position="none")
p3f=ggplot(subset(v,F=='1'),aes(x=V3,y=V7,col=as.factor(year),shape=Country))+geom_point()+theme_bw()+ggtitle('Max-missing=1, 90 SNPs')+xlab("PC1, 27.04%")+ylab("PC5, 8.11%")+ labs(color='Year') + theme(legend.position="none")
p4f=ggplot(subset(v,F=='unfiltered'),aes(x=V3,y=V7,col=as.factor(year),shape=Country))+geom_point()+theme_bw()+ggtitle('Unfiltered, 699602 SNPs')+xlab("PC1, 22.50%")+ylab("PC5, 7.56%")+ labs(color='Year') 

pdf('/home/kiwoong/Projects/Nlugens_GBS/Revision/PCA/PCA_filtering.pdf',width=15,height=3.5)
grid.newpage()
pushViewport(viewport(layout = grid.layout(1,43)))
print(p1f, vp = vplayout(1,c(1:10)))
print(p2f, vp = vplayout(1,c(11:20)))
print(p3f, vp = vplayout(1,c(21:30)))
print(p4f, vp = vplayout(1,c(31:43)))

dev.off()

