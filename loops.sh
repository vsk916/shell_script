#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"

validate () {
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 ... $R failure $N"
    else
        echo -e "$2 ... $R Success $N"
    fi
}


if [ $ID -ne 0 ]
then 
echo "you are not in the root"
else
echo "you are in the root"

for package in $@
do 
  yum list installed $package

  if [ $? -ne 0 ]
  then
     yum install $package -y
     validate $? "$package is installed"
else
  echo "$package is already installed .. $Y skipped $N"  
done
