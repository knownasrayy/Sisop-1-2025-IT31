#!/bin/bash

#Download file csv yang diberikan menggunakan wget
wget "https://drive.usercontent.google.com/u/0/uc?id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV&export=download" -O reading_data.csv

#A
awk '/Chris Hemsworth/ {++n}
END{
if(n>0){
print "Chris Hemsworth membaca", n,"buku."
}
else{
print "Chris Hemsworth tidak ditemukan."
}
}' reading_data.csv

#B
awk -F, '$8 == "Tablet" { total += $6; count++ }
END {
if (count > 0) {
print "Rata-rata durasi membaca dengan Tablet adalah", total / count, "menit";
}
else {
print "Data membaca dengan tablet tidak ditemukan."
}
}' reading_data.csv

#C
awk -F, 'NR > 1 && $7 > max { max = $7; name = $2; book = $3 }
END {
if (max > 0){
print "Pembaca dengan rating tertinggi:", name, "-", book, "-", max
}
else {
Print "Data rating tidak ditemukan."
}
}' reading_data.csv


#D
awk -F, '$9 ~ /Asia/ && $5 > "2023-12-31" {genre[$4]++}
END {
max_count = 0; for (g in genre) {
if (genre[g] > max_count) {
max_count = genre[g]; popular_genre = g;
}
}
if (max_count > 0) {
print "Genre paling populer di Asia setelah 2023 adalah", popular_genre, "dengan", max_count, "buku.";
}
else {
print "Data tidak ditemukan.";
}
}' reading_data.csv

