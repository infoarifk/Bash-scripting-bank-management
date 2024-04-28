#!/bin/bash

declare -A accounts

create_user() {

	read -p "Enter your username: " username

	if (( ${#accounts[$username]} !=0 ))
	then
	echo "
	-------------------------------------------------
	Username already exist. Please choose another one
	-------------------------------------------------
	"
	else
	read -s -p "Enter Password: " password

	accounts[$username]=$password

	echo "
	----------------------------------------------
	Account created successfully. Now Login please
	----------------------------------------------
	"
	return 1
	fi


}


user_login() {

	echo "Enter your username: "
	read username
	if (( ${#accounts[$username]} !=0 ))
	then
	echo "Enter password"
	read -s password
		if (( ${accounts[username]} == $password ))
		then
		echo "Login successful. Welcome, $username"
		return 0
		else
		echo "Incorrect password. Please try again"
		return 1
		fi
	else
	echo "Username not found. Please create an account"
	return 1
	fi







}
echo "==========WELCOME TO XYZ BANK==========="


#front page

while true
do
echo "1. Login"
echo "2. Create Account"
echo "3. Exit"
read -p "Choose an option: " option

if (($option == 1))
then
	user_login
elif (($option == 2))
then
	create_user

elif (($option == 3))
then
	echo "Exiting.."
	exit
else
	echo "Invalid option. Please try again"
fi
done
