#!/bin/bash

USERID=$(id -u)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGPATH=/tmp/$SCRIPTNAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Storage=$(df -hT | xfs)
Threshold=30

while IFS=read -r line
do
CurrentStorage=$($line | awk -F " " 'print $6F' | cut -d "%" -f1) &>>$LOGPATH
DiskName=$($line | awk -F " " 'print $NF') &>>$LOGPATH

if [ $CurrentStorage -ge $Threshold ]
then
echo "DiskPath $DiskName has crossed $Threshold currently at $CurrentStorage"
fi
done <<< $Storage