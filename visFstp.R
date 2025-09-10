library("ggplot2")

v=read.table('/home/knam/work/Nlugens_GBS/Revision/FST/randfst.txt')

fst=0.24439

mi=min(v$V1)-5e-3
Ma=fst+5e-3

nrow(subset(v,V1>=fst))/nrow(v)

p=ggplot(v,aes(x=V1))+geom_histogram(bins = 500)+theme_bw()+xlab("Fst")+xlim(mi,Ma)+ geom_vline(xintercept = fst, color = "red",size=1.5)
                
pdf("/home/knam/work/Nlugens_GBS/Revision/FST/Fst.p.pdf",width=5,height=4)
p
dev.off()

          
                



