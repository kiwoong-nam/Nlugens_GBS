#!/bin/bash

cd /home/knam/work/Nlugens_GBS/Revision/FST/rand

grep weighted s* | sed 's/^.* //' > ../randfst.txt

wc -l ../randfst.txt
