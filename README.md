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

### Output
```
Chris Hemsworth membaca 56 buku.
Rata-rata durasi membaca dengan Tablet adalah 152.381 menit
Pembaca dengan rating tertinggi: Robert Downey Jr. - Deep Space Mysteries - 6.0
Genre paling populer di Asia setelah 2023 adalah Mystery dengan 14 buku.
```













## Soal_3
Untuk merayakan ulang tahun ke 52 album The Dark Side of the Moon, tim PR Pink Floyd mengadakan sebuah lomba dimana peserta diminta untuk membuat sebuah script bertemakan setidaknya 5 dari 10 lagu dalam album tersebut. Sebagai salah satu peserta, kamu memutuskan untuk memilih Speak to Me, On the Run, Time, Money, dan Brain Damage. Saat program ini dijalankan, terminal harus dibersihkan terlebih dahulu agar tidak mengganggu tampilan dari fungsi fungsi yang kamu buat. Program ini dijalankan dengan cara `./dsotm.sh --play=”<Track>”` dengan Track sebagai nama nama lagu yang kamu pilih.

### A. Speak to Me
```
"Speak to Me")
            curl -s https://raw.githubusercontent.com/annthurium/affirmations/refs/heads/main/affirmations.js | 
            sed '1d;$d' | sed -E 's/^[[:space:]]*"//;s/",?$//;' | grep -v '^\];$' | while IFS= read -r line; do
                echo "$line"
                sleep 1
            done
```



















## Soal_4

# Pokemon Analysis Tool

## Deskripsi
Pokemon Analysis Tool adalah skrip berbasis Bash yang digunakan untuk menganalisis data dari file `pokemon_usage.csv`. Skrip ini menyediakan berbagai fitur seperti menampilkan statistik, mengurutkan data berdasarkan kolom tertentu, mencari Pokemon berdasarkan nama, dan memfilter berdasarkan tipe.

## Cara Menggunakan

### 1. Download dan Jalankan Skrip
Sebelum menjalankan skrip, pastikan file `pokemon_usage.csv` tersedia. Jika belum, skrip ini akan mengunduhnya secara otomatis dari URL yang telah ditentukan.

Unduh skrip:
```bash
wget "https://raw.githubusercontent.com/username/repository/main/pokemon_analysis.sh" -O pokemon_analysis.sh
chmod +x pokemon_analysis.sh
```

Jalankan skrip dengan perintah:
```bash
./pokemon_analysis.sh <file.csv> <command> [options]
```

### 2. Opsi Perintah
| Perintah | Deskripsi |
|----------|-------------|
| `--info` | Menampilkan statistik Pokémon dengan penggunaan tertinggi. |
| `--sort <column>` | Mengurutkan Pokémon berdasarkan kolom tertentu (usage, rawusage, hp, atk, def, spatk, spdef, speed, nama). |
| `--grep <name>` | Mencari Pokémon berdasarkan nama (case insensitive). |
| `--filter <type>` | Menampilkan semua Pokémon berdasarkan Type1 atau Type2. |
| `-h, --help` | Menampilkan halaman bantuan. |

### 3. Contoh Penggunaan

#### a) Menampilkan Informasi Pokémon dengan Penggunaan Tertinggi
**Perintah:**
```bash
./pokemon_analysis.sh pokemon_usage.csv --info
```
**Output:**
```
Summary of pokemon_usage.csv
Highest Adjusted Usage:  Pikachu with 25.67%
Highest Raw Usage:       Charizard with 1200 uses
```
**Kode yang Digunakan:**
```bash
if [[ "$2" == "--info" ]]; then
    HIGHEST_USAGE=$(awk -F',' 'NR > 1 {if ($2+0 > max) {max=$2; name=$1}} END {printf "%s with %.5f%%\n", name, max}' "$1")
    HIGHEST_RAW_USAGE=$(awk -F',' 'NR > 1 {if ($3+0 > max) {max=$3; name=$1}} END {printf "%s with %d uses\n", name, max}' "$1")
    echo "Summary of $1"
    echo "Highest Adjusted Usage:  $HIGHEST_USAGE"
    echo "Highest Raw Usage:       $HIGHEST_RAW_USAGE"
    exit 0
fi
```

#### b) Mengurutkan Pokémon Berdasarkan Penggunaan
**Perintah:**
```bash
./pokemon_analysis.sh pokemon_usage.csv --sort usage
```
**Output:**
```
Nama,Usage,RawUsage,Type1,Type2,HP,ATK,DEF,SPATK,SPDEF,Speed
Charizard,25.67,1200,Fire,Flying,78,84,78,109,85,100
Pikachu,20.50,950,Electric,,35,55,40,50,50,90
```
**Kode yang Digunakan:**
```bash
if [[ "$2" == "--sort" ]]; then
    COLUMN=$3
    case $COLUMN in
        "usage")   SORT_FIELD=2 ;;
        "rawusage") SORT_FIELD=3 ;;
        "hp")      SORT_FIELD=6 ;;
        "atk")     SORT_FIELD=7 ;;
        "def")     SORT_FIELD=8 ;;
        "spatk")   SORT_FIELD=9 ;;
        "spdef")   SORT_FIELD=10 ;;
        "speed")   SORT_FIELD=11 ;;
        "nama")    SORT_FIELD=1 ;;
        *) echo "Error: Invalid column '$COLUMN'!"; exit 1 ;;
    esac
    echo "$(head -n 1 "$1")"
    tail -n +2 "$1" | sort -t ',' -k"$SORT_FIELD" -nr
    exit 0
fi
```

#### c) Mencari Pokémon Berdasarkan Nama
**Perintah:**
```bash
./pokemon_analysis.sh pokemon_usage.csv --grep pikachu
```
**Output:**
```
Nama,Usage,RawUsage,Type1,Type2,HP,ATK,DEF,SPATK,SPDEF,Speed
Pikachu,20.50,950,Electric,,35,55,40,50,50,90
```
**Kode yang Digunakan:**
```bash
if [[ "$2" == "--grep" ]]; then
    echo "$(head -n 1 "$1")"
    awk -F',' -v name="$3" 'NR == 1 || tolower($1) ~ tolower(name)' "$1" | sort -t ',' -k2,2nr
    exit 0
fi
```

#### d) Menampilkan Pokémon Berdasarkan Tipe
**Perintah:**
```bash
./pokemon_analysis.sh pokemon_usage.csv --filter fire
```
**Output:**
```
Nama,Usage,RawUsage,Type1,Type2,HP,ATK,DEF,SPATK,SPDEF,Speed
Charizard,25.67,1200,Fire,Flying,78,84,78,109,85,100
Blaziken,18.90,800,Fire,Fighting,80,120,70,110,70,80
```
**Kode yang Digunakan:**
```bash
if [[ "$2" == "--filter" ]]; then
    if [[ -z "$3" ]]; then
        echo "Error: no filter option provided"
        exit 1
    fi
    echo "$(head -n 1 "$1")"
    awk -F',' -v type="$3" 'NR == 1 || tolower($4) == tolower(type) || tolower($5) == tolower(type)' "$1" | sort -t ',' -k2,2nr
    exit 0
fi
```

#### e) Menampilkan Halaman Bantuan
**Perintah:**
```bash
./pokemon_analysis.sh -h
```
**Output:**
```
POKEMON ANALYSIS TOOL
============================================================
Usage: ./pokemon_analysis.sh <file.csv> <command> [options]
Commands:
  --info                : Menampilkan statistik Pokémon dengan penggunaan tertinggi.
  --sort <column>       : Mengurutkan Pokémon berdasarkan kolom tertentu.
  --grep <name>         : Mencari Pokémon berdasarkan nama.
  --filter <type>       : Menampilkan semua Pokémon berdasarkan Type1 atau Type2.
  -h, --help            : Menampilkan halaman bantuan ini.
============================================================
```
