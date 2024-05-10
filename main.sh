#!/bin/bash

# Array to store usernames and passwords
usernames=()
passwords=()

# Array to store corresponding account balances
balances=()

# Function to validate login credentials
login() {
    read -p "Enter username: " username
    read -sp "Enter password: " password

    echo

    login_success=false

    for ((i=0; i<${#usernames[@]}; i++)); do
        if [[ "${usernames[$i]}" == "$username" && "${passwords[$i]}" == "$password" ]]; then
            echo "Login successful. Welcome ${usernames[$i]}"
            login_success=true
            main_menu $i
            break
        fi
    done

    if [[ $login_success == false ]]; then
        echo "Invalid username or password"
        main
    fi
}
# Function to create a new account
create_account() {

    read -p "Choose a username: " new_username
    read -sp "Choose a password: " new_password
    echo

    usernames+=("$new_username")
    passwords+=("$new_password")
    balances+=(0)

    echo "Account created successfully for $new_username"
    main
}

# Function to check account details
account_details() {
    local index=$1
    echo "Username: ${usernames[$index]}"
    echo "Current Balance: ${balances[$index]}"
}

# Function to deposit money
deposit() {
    ((balances[$1] += $2))
    echo "$2 deposited successfully. Your new balance is ${balances[$1]}"
}
# Function to withdraw money
withdraw() {
    if ((balances[$1] >= $2)); then
        ((balances[$1] -= $2))
        echo "$2 withdrawn successfully. Your new balance is ${balances[$1]}"
    else
        echo "Insufficient balance"
        main_menu $1
    fi
}
# Function to display the main menu
main_menu() {
    echo "Welcome ${usernames[$1]} to the Bank Management System"
    echo "1. Account Details"
    echo "2. Deposit"
    echo "3. Withdraw"
    echo "4. Logout"

    read -p "Enter your choice: " choice

    if [[ $choice == 1 ]]; then
        account_details $1
    elif [[ $choice == 2 ]]; then
        read -p "Enter amount to deposit: " amount
        deposit $1 $amount
    elif [[ $choice == 3 ]]; then
        read -p "Enter amount to withdraw: " amount
        withdraw $1 $amount
    elif [[ $choice == 4 ]]; then
        echo "Logout Successful"
        main
    else
        echo "Invalid choice. Please enter a number from 1 to 4."
    fi

    main_menu $1
}

# Main function
main() {
    echo "Welcome to the Bank Management System"
    echo "1. Login"
    echo "2. Create Account"
    echo "3. Exit"

    read -p "Enter your choice: " option

    if [[ $option == 1 ]]; then
        login
    elif [[ $option == 2 ]]; then
        create_account
    elif [[ $option == 3 ]]; then
        echo "Thank you for using our services. Goodbye!"
        exit
    else
        echo "Invalid choice. Please enter a number from 1 to 3."
        main
    fi
}

# Run the main function
main
