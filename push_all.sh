#/usr/bin/env bash

for r in $repos
do
    cd $r
    compush.sh
done

exit