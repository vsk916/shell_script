#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "Error : you are not in the root user"
    exit 1
else
    echo "you are root user"
fi

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "mysql is not installed"
else
    echo "mysql is installed"
fi