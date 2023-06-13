#!/bin/bash
string=$@
IFS=', ' read -r -a array <<< "$string"
function subtr()
{
    n=${#array[@]}
    i_of_last=$(( $n - 1 ))
    res=$(( ${array[i_of_last]} - ${array[0] }))
    echo $res
}

function mult()
{
    n=${#array[@]}
    i_of_last=$(( $n - 1 ))
    res=$(( ${array[i_of_last]} * ${array[0] }))
    echo $res
}
a=$( "mult" )
b=$( "subtr" )
echo multiplitcation $a
echo subtraction $b

