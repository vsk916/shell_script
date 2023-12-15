#!/bin/bash

ID=$(id -u)

validate (){

    if [ $1 -ne 0 ]
    then
        echo "$2 is not installed"
        exit 1
    else
        echo "$2 is installed"
    fi
    
}

if [ $ID -ne 0 ]
then
    echo "Error : you are not in the root user"
    exit 1
else
    echo "you are root user"
fi

yum install mysql -y
validate $? "installing mysql"

yum install git -y
validate $? "installing git"