library("ggplot2")
library(gridExtra)
library(grid)

vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)

output='/home/kiwoong/Projects/Nlugens_GBS/Revision/SweeD/Sweed.pdf'

vt=subset(read.table('/home/kiwoong/Projects/Nlugens_GBS/Revision/SweeD/res/mergedres.txt',h=T),chrN!='chrX')

v1=subset(vt,group=="group1")
v2=subset(vt,group=="group2")

v1$i=c(1:nrow(v1))
v2$i=c(1:nrow(v2))
v=rbind(v1,v2)

vg.1=aggregate(v$i,by=list(v$chrN),min)
vg.2=aggregate(v$i,by=list(v$chrN),max)
vg=merge(vg.1,vg.2,by="Group.1")
vg$center=with(vg,x.x+x.y)/2
colnames(vg)[1]='chro'

v$chro=factor(v$chrN,levels=unique(v$chrN))

################

p1=ggplot(v, aes(x=i, y=l,color=group)) +  geom_point(size = 0.8)+ labs(x = NULL, y = 'composite likelihood')+ scale_x_continuous(label = vg$chro,breaks = vg$center)+theme_bw()+scale_color_manual(values =c('red','blue'))+theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank())

p2=ggplot(v, aes(x=i, y=l,color=as.factor(chrN))) +  geom_point(size = 1)+scale_color_manual(values = rep(c("darkslateblue","cadetblue"), nrow(v)))+ labs(x = NULL, y = 'composite likelihood')+ scale_x_continuous(label = vg$chro,breaks = vg$center)+theme_bw()+theme(legend.position = "none",panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank())+facet_grid(group~.)

pdf(output,width=10,height=2.5)
p1
p2
dev.off()

g1q=with(v1,quantile(l,0.99))
g2q=with(v2,quantile(l,0.99))

subset(v1,l>g1q)
#  group chrN      pos        l i
#5 group1 chr1 43690736 6.077509 5
#8 group1 chr1 76358843 6.874865 8

#     group chrN      pos         l  i
#156 group2 chr1 54580105 10.159350  6
#205 group2 chr6 30879022  6.504574 55
#227 group2 chr8 34725045 10.930970 77


