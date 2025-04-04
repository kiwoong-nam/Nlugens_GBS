#!/bin/bash

cd /home/kiwoong/Projects/Nlugens_GBS/FST/rand

grep weighted r* | sed 's/^.* //' > ../randfst.txt

