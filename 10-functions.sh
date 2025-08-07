#!/bin/bash

USERID=$(id -u)

validate(){
if [ $1 -eq 0 ]
then
echo "$2......successful"
else
echo "$2.......Failed"
fi
}

if [ $USERID -eq 0 ]
then
echo "You are Super User"
else
echo "You are not Super User, please run this script as super user"
exit 1
fi


dnf install postfix -y
validate $? "postfix installation"


dnf install mysql -y
validate $? "mysql installation"