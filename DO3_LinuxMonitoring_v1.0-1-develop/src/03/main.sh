#!/bin/bash

cd "$(dirname $0)" 

if [ $# != 4 ];
then
    echo "Error: Input 4 parametr."
else
  flag=0
  for param in "$@"
  do
    if [[ $param =~ ^[1-6]$ ]]
    then 
      :
    else 
      echo "Error input $(( $count + 1 )): $param"
      flag=1
    fi
    count=$(( $count + 1 ))
  done
  
  if [ $flag -eq 0 ]
  then
    if [ $1 == $2 ] || [ $3 == $4 ] 
    then 
      echo "Error: Enter different values! ./main.sh <param1> <param2> <param3> <param4>"
      flag=1
    else 
      ./print.sh $1 $2 $3 $4
      exit 1
    fi
  fi
fi 
