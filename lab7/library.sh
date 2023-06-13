#!/bin/bash
function get_array()
{
    read -p "please enter number array: " string
    IFS=', ' read -r -a array <<< "$string"
    echo ${array[@]}
}