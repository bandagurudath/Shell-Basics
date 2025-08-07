#!/bin/bash

Number1=$1
Number2=$2

if [ $Number1 -ge $Number2 ]
then
echo "$Number1 is greater than $Number2"
else
echo "$Number1 is lesser than $Number2"
fi