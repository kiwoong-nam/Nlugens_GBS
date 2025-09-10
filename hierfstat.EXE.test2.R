library("hierfstat")

vs=read.table('/home/kiwoong/Projects/Nlugens_GBS/Revision/hierfst/input/sample.txt',h=T)
vg=read.table('/home/kiwoong/Projects/Nlugens_GBS/Revision/hierfst/input/geno_test.txt')

attach(vs)

test.within(vg,test=lev3,within=lev2,nperm=1000)



