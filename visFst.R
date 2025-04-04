library('ggplot2')
library(gridExtra)
library(grid)

vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)

output='/home/kiwoong/Projects/Nlugens_GBS/FST/Fst_alongGenome.pdf'

v=read.table('/home/kiwoong/Projects/Nlugens_GBS/FST/bg.windowed.weir.fst',header=T)
v$i=c(1:nrow(v))

vg1=aggregate(v$i,by=list(v$CHROM),min)
vg2=aggregate(v$i,by=list(v$CHROM),max)

vg=merge(vg1,vg2,by="Group.1")
vg$center=with(vg,x.x+x.y)/2
colnames(vg)[1]='chro'

p=ggplot(v, aes(x=i, y=WEIGHTED_FST,color=CHROM)) +  geom_point(size = 0.3)+ labs(x = NULL, y = 'Fst')+ scale_x_continuous(label = vg$chro,breaks = vg$center)+theme_bw()+theme(legend.position = "none",panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank())+theme(axis.text=element_text(size=8),axis.title=element_text(size=16.5),plot.title = element_text(size=23),strip.text.y = element_text(size = 20))+scale_color_manual(values = rep(c("darkslateblue","cadetblue"), nrow(v)))+ theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))

pdf(output,width=10/1.2,height=3/1.2)
p
dev.off()

