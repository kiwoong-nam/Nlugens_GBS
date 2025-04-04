#!/bin/bash

cd /home/knam/work/Nlugens_GBS/sNMF

grep 'Cross-Entropy' *log | grep masked | sed 's/\.log.* /\t/' > CV.txt



