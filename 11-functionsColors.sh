#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

validate(){
if [ $1 -eq 0 ]
then
echo -e "$2......$G successful $N"
else
echo -e "$2....... $R Failed $N"
fi
}

if [ $USERID -eq 0 ]
then
echo -e "$G You are Super User $N"
else
echo -e "$R You are not Super User, please run this script as super user $N"
exit 1
fi

dnf install postfix -y
validate $? "postfix installation"

dnf install mysql -y
validate $? "mysql installation"