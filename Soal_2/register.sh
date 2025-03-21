#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Penggunaan: $0 email username password"
  exit 1
fi

email="$1"
username="$2"
password="$3"
salt="ArcaeaSalt"

if [[ ! $email =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
  echo "Format email tidak valid."
  exit 1
fi

if [[ ! $password =~ ^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,}$ ]]; then
  echo "Password harus minimal 8 karakter, mengandung huruf besar, huruf kecil, dan angka."
  exit 1
fi

if grep -q "^$email," data/player.csv; then
  echo "Email sudah terdaftar."
  exit 1
fi

hashed_password=$(echo -n "$password$salt" | sha256sum | cut -d' ' -f1)

echo "$email,$username,$hashed_password" >> data/player.csv

echo "Pendaftaran berhasil!"
