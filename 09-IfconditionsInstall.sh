#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]
then
echo "You are Super User"
else
echo "You are not Super User, please run this script as super user"
exit 1
fi

dnf install postfix -y
if [ $? -eq 0 ]
then
echo "postfix installation successful"
else
echo "postfix installation Failed"
fi

dnf install mysql -y
if [ $? -eq 0 ]
then
echo "mysql installation successful"
else
echo "mysql installation Failed"
fi