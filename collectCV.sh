#!/bin/bash

cd /home/kiwoong/Projects/Nlugens_GBS/Revision/sNMF

grep 'Cross-Entropy' *log | grep masked | sed 's/\.log.* /\t/' > CV.txt



