#!/bin/bash
if ! [[ -n $1 ]]
then
echo No parameters
exit 1
fi

if [[ $1 == "-a" ]]
then 
ps

#run source p4.sh -b lol
elif [[ $1 == "-b" ]]
then 
    if [[ $# -ne 2 ]]
    then
    echo You need to give directory name as a parameter
    exit 1
    fi

    mkdir $2
    cd $2

elif [[ $1 == "-c" ]]; then
    if [[ $# -ne 3 ]]; then
        echo you need to give 2 numbers as parameters
        exit 1
    fi
    re='^[0-9]+$'
    if [[ $2 =~ $re ]] && [[ $3 =~ $re ]]; then
        result=$(( $2 + $3 ))
        echo $result
        else
        echo "error: Not a number"
        exit 1
    fi

elif [[ $1 == "-d" ]]; then
    re='^[0-9]+$'
    if [[ $# -ne 3 ]] || ! [[ $3 =~ $re ]]; then
        echo you need to give filename and number as parameters
        exit 1
    fi
    echo "$3" > $2

elif [[ $1 == "-e" ]]; then
    if [[ $# -ne 2 ]]; then
        echo you need to give filename that you want to archive
        exit 1
    fi
    if test -f "$2"; then
        tar cf $2.tar $2    
    else  
        echo Such file doesnt exist
        exit 1
    fi

elif [[ $1 == "-f" ]]; then
    if [[ $# -ne 2 ]]; then
        echo you need to give username that you want to check
        exit 1
    fi
    re='^[0-9]+$'
    outp=$(id -u $2)
    if [[ $outp =~ $re ]]; then
        echo user with name $2 exists
    fi

elif [[ $1 == "-g" ]]; then
    re='^[0-9]+$'
    if [[ $# -ne 3 ]] || ! [[ $2 =~ $re ]] || ! [[ $3 =~ $re ]]; then
        echo you need to give 2 numbers to compare
        exit 1
    fi
    
    if [[ $2 < $3 ]]; then
        echo "$2 < $3"
    
    elif [[ $2 == $3 ]]; then
        echo "$2 == $3"
    
    else
        echo "$2 > $3"
    fi

elif [[ $1 == "-h" ]]; then
    if [[ $# -ne 2 ]]; then
        echo you need to give path that you want to check
        exit 1
    fi

    if [[ -f $2 ]]; then
        echo file exists
    elif [[ -d $2 ]]; then
        echo directory exists
    else
        echo nothing there
    fi

elif [[ $1 == "-i" ]]; then
    if [[ $# -ne 2 ]]; then
        echo you need to give path that you want to check
        exit 1
    fi
    outp=$(ls -l $2)
    k=0
    for (( i=0; k<2; i++ )); do
        echo "${outp:$i:1}"
        if [[ ${outp:$i:1} == "r" ]]; then
            echo readable
        fi
        if [[ ${outp:$i:1} == "w" ]]; then
            echo writable
        fi
        if [[ ${outp:$i:1} == "x" ]]; then
            echo executable
        fi
        
        if [[ $i == 0 ]] && [[ ${outp:$i:1} != "-" ]]; then
            echo this is not a file
            exit 2
        fi
        if [[ ${outp:$i:1} == "-" ]]; then
            k=$(( $k + 1 ))
        fi
    done

elif [[ $1 == "-j" ]]; then
    if [[ $# -ne 2 ]]; then
        echo you need to give path that you want to check
        exit 1
    fi
    k=0
    while read p; do
        echo "$p"
        IFS=' ' read -r -a array <<< "$p"
        temp_n=${#array[@]}
        k=$(( $k + $temp_n ))
    done < $2
    echo $k words

elif [[ $1 == "-k" ]]; then
    echo "sudo shutdown -r now"

else 
    echo no valid keys were given
fi

