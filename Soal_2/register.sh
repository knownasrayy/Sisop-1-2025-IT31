#!/bin/bash

DB_FILE="/data/player.csv"

read -p "Enter Email: " EMAIL
read -p "Enter Username: " USERNAME
read -s -p "Enter Password: " PASSWORD
echo  


PASSWORD_HASH=$(echo -n "$PASSWORD" | sha256sum | awk '{print $1}')

if [ ! -f "$DB_FILE" ]; then
    mkdir -p "$(dirname "$DB_FILE")"
    touch "$DB_FILE"
fi

echo "$EMAIL,$USERNAME,$PASSWORD_HASH" >> "$DB_FILE"

echo "Registration successful!"
