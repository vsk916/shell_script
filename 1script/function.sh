#!/bin/bash

ID=$(id -u)

Timestamp=$(date +%F-%H-%M-%S)
LOG_FILE="/tmp/$0-$Timestamp.log"

validate (){

    if [ $1 -ne 0 ]
    then
        echo -e "$2 is \e[31m not installed"
        exit 1
    else
        echo -e "$2 is \e[32m installed"
    fi
    
}

if [ $ID -ne 0 ]
then
    echo "Error : you are not in the root user"
    exit 1
else
    echo "you are root user"
fi

yum install mysql -y  &>> $LOG_FILE
validate $? "installing mysql"

yum install git -y  &>> $LOG_FILE
validate $? "installing git"