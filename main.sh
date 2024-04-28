#!/bin/bash

declare -A accounts
headline() {

	echo "             ==========WELCOME TO XYZ BANK==========="

}
create_user() {
	clear
	headline
	echo "-------USER ACCOUNT CREATE-------"
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
	clear
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
		if (( ${accounts[$username]} == $password ))
		then
		echo "Login successful. Welcome, $username"
		after_login
		else
		echo "Incorrect password. Please try again"
		return 1
		fi
	else
	echo "Username not found. Please create an account"
	return 1
	fi
}

after_login() {
while true

do
echo "1. Deposit"
echo "2. Withdraw"
echo "3. Account Details"
echo "4. Logout"
read -p "Choose an option: " option
if (($option == 1))
then
echo "Deposit"
elif (($option == 2))
then
echo "Withdraw"
elif (($option == 3))
then
echo "Account Details"
elif (($option == 4))
then
echo "Logging out.."
return 1
else
echo "Invalid option. Please try again."
fi
done
 }




#front page
clear
headline

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
	clear
	echo "Thank you"
	exit

else
	echo "Invalid option. Please try again"
fi
done
