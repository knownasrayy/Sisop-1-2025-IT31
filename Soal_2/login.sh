#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Penggunaan: $0 email password"
  exit 1
fi

email="$1"
password="$2"
salt="ArcaeaSalt"

hashed_password=$(echo -n "$password$salt" | sha256sum | cut -d' ' -f1)

if grep -q "^$email,.*,$hashed_password$" data/player.csv; then
  echo "Login berhasil!"
else
  echo "Login gagal. Email atau password salah."
fi
