#!/bin/bash
n=$1
echo > "p3_1.in"
for (( i=0; i<n; i++))
{
    echo $(( $RANDOM % 100 )) >> p3_1.in
}

function maxi()
{
    filename=$1
    maxi=-1
    while read line
    do 
        temp=$line
        if [[ $temp -gt $maxi ]]; then
        maxi=$temp
        fi
    done < $filename
    echo $maxi
}

echo "$( maxi "p3_1.in" )"