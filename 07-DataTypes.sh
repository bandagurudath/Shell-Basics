#!/bin/bash

Number1=$1
Number2=$2

Movies=("FirstMovie" "SecondMovie" "ThirdMovie")

Sum=$(($Number1+$Number2))

echo "sum of $Number1 and $Number2 is $Sum"

for i in $Movies
do
echo "Movie$i : ${Movies[$i]}"
done