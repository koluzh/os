#!/bin/bash
if [[ $# == 3 ]] 
then
    if [[ $(( $1 % 2 )) == 0 ]]
    then
        echo $1 
    elif [[ $(( $2 % 2 )) == 0 ]]
    then
        echo $2 
    elif [[ $(( $3 % 2 )) == 0 ]]
    then
        echo $3 
    else
        echo No even numbers given
    fi
else
    echo No parameters found
fi