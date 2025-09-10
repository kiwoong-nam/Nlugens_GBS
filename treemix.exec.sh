#!/bin/bash

module load bioinfo/TreeMix/1.13

cd /home/knam/work/Nlugens_GBS/Revision/TreeMix/treemix

treemix -i input/Treemix.treemix.frq.gz -o Treemix -root N_muiri  -m 1

