#!/bin/bash

cd "$(dirname $0)" 
source color.conf 
echo "[$column1_backgrpund] [$column1_font_color] [$column2_backgrpund] [$column2_font_color]"

# 1
if [[ $column1_backgrpund =~ ^[1-6]$ ]]
then 
  :
else 
  echo "Error input: [$column1_backgrpund]"
  column1_backgrpund=6
  echo "Set default: [$column1_backgrpund]"
fi

# 2
if [[ $column1_font_color =~ ^[1-6]$ ]]
then 
 :
else 
  echo "Error input: [$column1_font_color]"
  column1_font_color=4
  echo "Set default: [$column1_font_color]"
fi

# 1!=2
if [ $column1_backgrpund == $column1_font_color ]
then
  echo "Error: Enter different values!"
  column1_font_color=$(($column1_font_color-1))
  if [ $column1_font_color == 0 ] 
  then
    column1_font_color=6
  fi
  echo "Set new:[$column1_font_color]"
fi
  
# 3
if [[ $column2_backgrpund =~ ^[1-6]$ ]]
then 
  :
else 
  echo "Error input: [$column2_backgrpund]"
  column2_backgrpund=4
  echo "Set default: [$column2_backgrpund]"
fi

# 4
if [[ $column2_font_color =~ ^[1-6]$ ]]
then 
 :
else 
  echo "Error input: [$column2_font_color]"
  column2_font_color=6
  echo "Set default: [$column2_font_color]"
fi


# 3!=4
if [ $column2_backgrpund == $column2_font_color ]
then
  echo "Error: Enter different values!"
  column2_font_color=$(($column2_font_color - 1))
    if [ $column2_font_color == 0 ] 
  then
    column2_font_color=6
  fi
  echo "Set new:[$column2_font_color]"
fi

echo "[$column1_backgrpund] [$column1_font_color] [$column2_backgrpund] [$column2_font_color]"
./print.sh $column1_backgrpund $column1_font_color $column2_backgrpund $column2_font_color