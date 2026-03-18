#!/bin/bash


<<help
this is a shell script 
to create users

help



echo "============= Creation of User Started ====================="

read -p "enter the username:" username

read -p "enter the password:" password

#sudo useradd -m -p "$password" "$username"

sudo useradd -m "$username"

echo -e "$password\n$password" | sudo passwd "$username"

echo "============= Creation of User Completed ============="

sudo userdel $username

echo "============ Deletion of User completed =================="

if [ $(cat /etc/passwd | grep $username | wc | awk '{print $1}') == 0 ]; 
then
	echo "as wc is 0 the user is deleted"

else
	echo "the user was not deleted"

fi

