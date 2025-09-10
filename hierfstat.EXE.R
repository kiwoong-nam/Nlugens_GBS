library("hierfstat")

vs=read.table('/home/kiwoong/Projects/Nlugens_GBS/Revision/hierfst/input/sample.txt',h=T)
vg=read.table('/home/kiwoong/Projects/Nlugens_GBS/Revision/hierfst/input/geno.txt')

attach(vs)

varcomp.glob(vs,vg)

