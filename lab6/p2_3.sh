#!/bin/bash
if [[ $# == 10 ]]
then
mini=3
i=1
while [[ $i -lt 11 ]]
do 
    k=${!i}
    if [[ $(( k % 2 )) == 0 ]]
        then 
        if [[ $(( $mini % 2 )) == 1 ]] || [[ $k -lt $mini ]]
        then 
        mini=$k
        fi
    fi
    i=$(($i + 1))
done
echo $mini
else
echo No parameters
fi
