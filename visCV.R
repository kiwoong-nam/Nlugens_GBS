library("ggplot2")

v1=read.table('CV.txt')
v2=read.table('a100/CV.txt')

v1$alpha=0
v2$alpha=100

v=rbind(v1,v2)

p=ggplot(v,aes(x=as.factor(V1),y=V2,col=as.factor(alpha)))+geom_point()+xlab("K")+ylab("Cross-Entrophy")+theme_bw()+ guides(colour=guide_legend(title=expression(alpha)))

pdf("figure/CV.pdf",width=4,height=4.6)
p
dev.off()
