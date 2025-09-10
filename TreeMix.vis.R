source('/usr/local/bioinfo/src/TreeMix/treemix-1.13/src/plotting_funcs.R')

pdf("/home/knam/work/Nlugens_GBS/Revision/TreeMix/treemix.pdf",width=12/1.75,height=8/1.25)
plot_tree("/home/knam/work/Nlugens_GBS/Revision/TreeMix/treemix/Treemix")
dev.off()


