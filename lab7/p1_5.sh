#!/bin/bash
function factorial() {
    n=$1
    fact=1
    for(( i=1; i <= $n; i++))
    {
        fact=$(( $fact * $i ))
    }
    echo $fact
}

echo 1 > "p1_5.out"

for (( i=2; i <= 10; i++ ))
{
    temp="$(factorial "$i")"
    echo $temp >> "p1_5.out"
}