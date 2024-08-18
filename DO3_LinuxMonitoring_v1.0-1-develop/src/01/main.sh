#!/bin/bash

if [ $# != 1 ];
then
    echo "Error: Input 1 parametr: ./main.sh <param1>"
else
    if [[ $1 =~ ^-?([0-9])+(\.?)+([0-9]?)+$ ]]
    then 
        echo "Error: You entered a number: [$1] Enter the string:"
    else 
        echo $1
    fi
fi