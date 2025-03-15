# Sisop-1-2025-IT31

- Erlangga Valdhio Putra Sulistio_5027241030
- Rayhan Agnan Kusuma_5027241102
- S. Farhan Baig_5027241097


## Soal_1
Pada soal ini, kita diminta untuk menganalisis file reading_data.csv menggunakan awk.
kemudian kita diminta untuk:
1. Menghitung jumlah buku yang dibaca oleh Chris Hemsworth.
2. Menghitung rata-rata durasi membaca untuk buku-buku yang dibaca menggunakan Tablet. 
3. Mencari siapa yang memberikan rating tertinggi untuk buku yang dibaca beserta nama dan judul bukunya.
4. Menganalisis data untuk menemukan genre yang paling sering dibaca di Asia setelah 31 Desember 2023, beserta jumlahnya.

**Download file csv yang diberikan menggunakan wget**
```
wget "https://drive.usercontent.google.com/u/0/uc?id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV&export=download" -O reading_data.csv
```
**A. Menghitung jumlah buku yang dibaca oleh Chris Hemsworth**
```
awk '/Chris Hemsworth/ {++n}
END{
if(n>0){
print "Chris Hemsworth membaca", n,"buku."
}
else{
print "Chris Hemsworth tidak ditemukan."
}
}' reading_data.csv
```
**B. Menghitung rata-rata durasi membaca untuk buku-buku yang dibaca menggunakan Tablet**
```
awk -F, '$8 == "Tablet" { total += $6; count++ }
END {
if (count > 0) {
print "Rata-rata durasi membaca dengan Tablet adalah", total / count, "menit";
}
else {
print "Data membaca dengan tablet tidak ditemukan."
}
}' reading_data.csv
```
































































## Soal_4

  
