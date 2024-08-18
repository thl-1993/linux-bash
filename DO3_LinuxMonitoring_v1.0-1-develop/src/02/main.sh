#!/bin/bash

cd "$(dirname $0)" 


./output.sh

echo "Do you want to save? (y/n)"
read result
if [ $result = "Y" ] || [ $result = "y" ]
then
    result_file=$(date +%d_%m_%Y_%H_%M_%S).status

    ./output.sh >> $result_file
    echo "Saved in $result_file"
fi
