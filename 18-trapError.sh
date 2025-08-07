#!/bin/bash

set -e

USERID=$(id -u)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGPATH=/tmp/$SCRIPTNAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

trap 'failure $LINENO "$BASH_COMMAND"' ERR

failure(){
   echo "failed at $1 and command is $2"
}

if [ $USERID -eq 0 ]
then
echo -e "$G You are Super User $N"
else
echo -e "$R You are not Super User, please run this script as super user $N"
exit 1
fi

dnf install posttfix -y &>>$LOGPATH

dnf install myssql -y &>>$LOGPATH