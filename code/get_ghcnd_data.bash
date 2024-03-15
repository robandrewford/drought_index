#!/usr/bin/env bash
# save into a specific folder

file=$1

rm data/$file

wget -P data/ https://www.ncei.noaa.gov/pub/data/ghcn/daily/$file

# ghcnd_all.tar.gz
# ghcnd-stations.txt
# ghcnd-inventory.txt