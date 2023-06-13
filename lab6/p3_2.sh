#!/bin/bash
if ! [[ -n $1 ]]
then
echo No parameters
exit 1
fi

if [[ $1 == "man" ]]
then
man bash
fi

if [[ $1 == "ls" ]]
then
ls
fi

if [[ $1 == "df" ]]
then
df
fi

if [[ $1 == "ifconfig" ]]
then
ifconfig
fi

if [[ $1 == "pwd" ]]
then
pwd
fi