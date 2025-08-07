#!/bin/bash

USERID=$(id -u)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGPATH=/tmp/$SCRIPTNAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Files=$(find /tmp/ -name "*.log" -mtime +14)

while IFS= read -r line
do
echo "Deleting file : $line"
rm -rf $line &>>$LOGPATH
done <<< $Files