#!/bin/bash

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
	echo "Login"
elif (($option == 2))
then
	echo "Create Account"
elif (($option == 3))
then
	echo "Exiting.."
	exit
else
	echo "Invalid option. Please try again"
fi
done
