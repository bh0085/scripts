#/usr/bin/env bash

for r in $repos
do
    cd $r
    compull.sh
done 

exit