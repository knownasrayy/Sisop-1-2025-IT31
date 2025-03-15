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

### Membuat file bernama poppo_siroyo.sh
```
nano poppo_siroyo.sh
```
- `nano` adalah teks editor berbasis terminal yang banyak digunakan di Linux

### Download file csv yang diberikan menggunakan wget
```
wget "https://drive.usercontent.google.com/u/0/uc?id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV&export=download" -O reading_data.csv
```
- `wget` untuk mengunduh file
- `-O` untuk menentukan nama file
  
### A. Menghitung jumlah buku yang dibaca oleh Chris Hemsworth
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
Menggunakan `awk` untuk membaca file reading_data.csv
- `'/Chris Hemsworth/ {++n}` setiap kali ada "Chris Hemsworth" maka `n` akan bertambah 1

### B. Menghitung rata-rata durasi membaca untuk buku-buku yang dibaca menggunakan Tablet
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
- `'$8 == "Tablet" { total += $6; count++ }` digunakan untuk memeriksa apakah di kolom 8 ada "Tablet", jika ada maka angka yang ada pada kolom 6 akan ditambahkan ke `total` lalu `count` akan bertambah
- `total/count` berfungsi untuk menghitung rata-rata durasi membaca buku yang dibaca menggunakan tablet

### C. Mencari siapa yang memberikan rating tertinggi untuk buku yang dibaca beserta nama dan judul bukunya.
```
awk -F, 'NR > 1 && $7 > max { max = $7; name = $2; book = $3 }
END {
if (max > 0){
print "Pembaca dengan rating tertinggi:", name, "-", book, "-", max
}
else {
Print "Data rating tidak ditemukan."
}
}' reading_data.csv
```
- `$7 > max` command ini berfungsi untuk mengecek rating terbesar di kolom 7
- `{ max = $7; name = $2; book = $3 }` jika nilai `$7` lebih besar dari `max` maka nilai `max` akan diganti menjadi nilai `$7`, setelah mendapat nilai rating tertinggi maka `%2` akan tersimpan di dalam `name` dan `$3` tersimpan dalam `book` yang sesuai dengan baris dimana nilai rating tertinggi berada

### D. Menganalisis data untuk menemukan genre yang paling sering dibaca di Asia setelah 31 Desember 2023, beserta jumlahnya
```
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
```
- `$9 ~ /Asia/ && $5` berfungsi untuk hanya mencari yang mengandung "Asia" dan mencari tanggal setelah "2023-12-31"
- `genre[$4]++` berfungsi untuk menghitung berapa kali genre itu muncul
- `for (g in genre)` loop untuk memeriksa genre yang sudah dihitung
- `if (genre[g] > max_count)` berfungsi untuk memeriksa apakah genre lebih besar dari `max_count`, jika iya, nilai `max_count` dan `popular_genre` akan diubah











































## Soal_3
Untuk merayakan ulang tahun ke 52 album The Dark Side of the Moon, tim PR Pink Floyd mengadakan sebuah lomba dimana peserta diminta untuk membuat sebuah script bertemakan setidaknya 5 dari 10 lagu dalam album tersebut. Sebagai salah satu peserta, kamu memutuskan untuk memilih Speak to Me, On the Run, Time, Money, dan Brain Damage. Saat program ini dijalankan, terminal harus dibersihkan terlebih dahulu agar tidak mengganggu tampilan dari fungsi fungsi yang kamu buat. Program ini dijalankan dengan cara `./dsotm.sh --play=”<Track>”` dengan Track sebagai nama nama lagu yang kamu pilih.




















## Soal_4

  
