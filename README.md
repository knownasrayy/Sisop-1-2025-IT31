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
```bash
nano poppo_siroyo.sh
```
- `nano` adalah teks editor berbasis terminal yang banyak digunakan di Linux

### Download file csv yang diberikan menggunakan wget
```bash
wget "https://drive.usercontent.google.com/u/0/uc?id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV&export=download" -O reading_data.csv
```
- `wget` untuk mengunduh file
- `-O` untuk menentukan nama file
  
### A. Menghitung jumlah buku yang dibaca oleh Chris Hemsworth
```bash
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
```bash
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
```bash
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
```bash
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



## Soal_2
Pada soal ini, kita diminta membuat sistem pencatatan Player aktif agar terpisah dari Observer, dengan shell script:
### A. register.sh 
→ Mendaftarkan Player baru menggunakan email, username, dan password, lalu menyimpannya di /data/player.csv.
![Screenshot 2025-03-15 235839](https://github.com/user-attachments/assets/4cc20517-3187-44df-b7b0-c234a9ff2493)








## Soal_3
Untuk merayakan ulang tahun ke 52 album The Dark Side of the Moon, tim PR Pink Floyd mengadakan sebuah lomba dimana peserta diminta untuk membuat sebuah script bertemakan setidaknya 5 dari 10 lagu dalam album tersebut. Sebagai salah satu peserta, kamu memutuskan untuk memilih Speak to Me, On the Run, Time, Money, dan Brain Damage. Saat program ini dijalankan, terminal harus dibersihkan terlebih dahulu agar tidak mengganggu tampilan dari fungsi fungsi yang kamu buat. Program ini dijalankan dengan cara `./dsotm.sh --play=”<Track>”` dengan Track sebagai nama nama lagu yang kamu pilih.

### A. Speak to Me
```bash
"Speak to Me")
            curl -s https://raw.githubusercontent.com/annthurium/affirmations/refs/heads/main/affirmations.js | 
            sed '1d;$d' | sed -E 's/^[[:space:]]*"//;s/",?$//;' | grep -v '^\];$' | while IFS= read -r line; do
                echo "$line"
                sleep 1
            done
```
- `curl -s` berfungsi untuk mengunduh file dan membuat output tidak menampilkan informasi tambahan
- `sed '1d;$d'` berfungsi untuk menghapus baris pertama dari file dan menghapus baris terakhir dari file
- `'s/^[[:space:]]*"//` berfungsi untuk menghapus spasi awal dan tanda kutip
- `s/",?$//;' ` berfungsi untuk menghapus tanda kutip di akhir baris dan juga koma
- `grep -v '^\];$'` berfungsi untuk menampilkan semua baris kecuali yang ada `];`
- `while IFS= read -r line` berfungsi untuk membaca setiap line

### Output
```
You are enough.
Believe in yourself.
You are capable of great things.
```

#### A. Speak to Me (REVISI)
```bash
        "Speak to Me")
            colors=(31 32 33 34 35 36 91 92 93 94 95 96)
            title_color=${colors[$RANDOM % ${#colors[@]}]}
            echo -ne "\e[1;${title_color}m╔════════════════════════════════════════╗\e[0m\n"
            echo -ne "\e[1;${title_color}m║        SPEAK TO ME AFFIRMATIONS       ║\e[0m\n"
            echo -ne "\e[1;${title_color}m╚════════════════════════════════════════╝\e[0m\n"
            curl -s https://raw.githubusercontent.com/annthurium/affirmations/refs/heads/main/affirmations.js | 
            sed '1d;$d' | sed -E 's/^[[:space:]]*"//;s/",?$//;' | grep -v '^\];$' | while IFS= read -r line; do
                color=${colors[$RANDOM % ${#colors[@]}]}
                echo -ne "\e[1;${color}m"
                for ((i=0; i<${#line}; i++)); do
                    echo -ne "${line:$i:1}"
                    sleep 0.05
                done
                echo -ne "\e[0m\n\n"
                sleep 1
            done
            ;;
```
Ada beberapa kode yang ditambahkan dalam soal ini berupa update hiasan untuk outputnya


### B. On The Run
```bash
 "On the Run")
            echo -ne "Ready, set, go! "
            progress=0
            while [ $progress -lt 100 ]; do
                progress=$((progress + RANDOM % 10))
                [ $progress -gt 100 ] && progress=100
                echo -ne "\rReady, set, go! [$(printf '#%.0s' $(seq 1 $((progress / 2))))$(printf ' %.0s' $(seq 1 $((50 - progress / 2))))] $progress%"
                sleep $(awk -v min=0.1 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')
            done
            echo -e "\nDone!"
            ;;
```
- `echo -ne "Ready, set, go! "` berfungsi untuk menampilkan teks tanpa baru
- `progress=0` berfungsi untuk memulai progress dari 0%
- `while [ $progress -lt 100 ]; do` berfungsi untuk membuat loop berjalan selama belum 100%
- `progress=$((progress + RANDOM % 10))` berfungsi untuk menambahkan nilai acak antara 0 hingga 9
- `[ $progress -gt 100 ] && progress=100 ` berfungsi untuk memaksa progress menjadi 100 jika angka melebihi 100
- `$(printf '#%.0s' $(seq 1 $((progress / 2))))` berfungsi untuk membuat # sebanyak `(progress / 2)`
- `$(printf ' %.0s' $(seq 1 $((50 - progress / 2))))` berfungsi untuk mengisi sisa tempat dengan spasi
- `sleep $(awk -v min=0.1 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')` berfungsi untukk menghasilkan angka acak antara 0.1 hingga 1 detik

### Output
```
Ready, set, go! [#########                                         ] 20%
Ready, set, go! [#####################                             ] 50%
Ready, set, go! [#########################################         ] 80%
Ready, set, go! [##################################################] 100%
Done!
```


### C. Time
Menampilkan jam secara real-time yang diperbarui setiap detik.

**Perintah:**
```bash
./dsotm.sh --play="Time"
```
**Output (diperbarui setiap detik):**
```
2025-03-15 12:34:56
2025-03-15 12:34:57
2025-03-15 12:34:58
```
**Kode yang Digunakan:**
```bash
while true; do
    echo -ne "\r$(date '+%Y-%m-%d %H:%M:%S')"
    sleep 1
done
```

### D. Money
Menampilkan efek *matrix rain* berisi simbol mata uang.

**Perintah:**
```bash
./dsotm.sh --play="Money"
```
**Output (simulasi terminal):**
```
$ € ¥ £ ฿ ₣
€ ¥ £ ฿ ₣ $
¥ £ ฿ ₣ $ €
```
**Kode yang Digunakan:**
```bash
symbols=( "$" "€" "£" "¥" "₫" "₹" "฿" "₣" )
cols=$(tput cols)
rows=$(tput lines)
declare -a rain
for ((i=0; i<$cols; i++)); do
    rain[$i]=$(( RANDOM % rows ))
done
while true; do
    clear
    for ((row=0; row<$rows; row++)); do
        for ((col=0; col<$cols; col++)); do
            if [[ ${rain[$col]} -eq $row ]]; then
                printf "\e[31m%s\e[0m" "${symbols[RANDOM % ${#symbols[@]}]}"
            else
                printf " "
            fi
        done
        echo ""
    done
    for ((i=0; i<$cols; i++)); do
        ((rain[$i]++))
        if (( rain[$i] > rows )); then
            rain[$i]=0
        fi
    done
    sleep 0.2
done
```



### E. Brain Damage
Menampilkan *task manager* seperti `top` yang diperbarui setiap detik.

**Perintah:**
```bash
./dsotm.sh --play="Brain Damage"
```
**Output (diperbarui setiap detik):**
```
Brain Damage Task Manager - 12:34:56
PID   USER      %CPU %MEM   VSZ   RSS COMMAND
1234  user      12.3  4.5  123456  65432 firefox
5678  root      8.9   2.1  98765   54321 chrome
```
**Kode yang Digunakan:**
```bash
while true; do
    clear
    echo -e "\e[1;33mBrain Damage Task Manager - $(date '+%H:%M:%S')\e[0m"
    echo -e "\e[1;34mPID   USER      %CPU %MEM   VSZ   RSS COMMAND\e[0m"
    ps -eo pid,user,%cpu,%mem,vsz,rss,comm --sort=-%cpu | head -n 10
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
#### b) Revisi Mengurutkan Pokémon Berdasarkan Penggunaan

**Kesalahan code sebelumnya :**
Kolom "nama" belum diurutkan secara alfabetis (ascending).
Kolom numerik belum diurutkan secara descending.

```bash
./pokemon_analysis.sh pokemon_usage.csv --sort nama
```
**Output:**
```
Pokemon,Usage%,RawUsage,Type1,Type2,HP,Atk,Def,SpAtk,SpDef,Speed
Alomomola,8.02521%,144892,Water,None,165,75,80,40,45,65
Amoonguss,1.32496%,26867,Grass,Poison,114,85,70,85,80,30
Araquanid,2.27739%,133483,Water,Bug,68,70,92,50,132,42
Arcanine,0.10297%,8056,Fire,None,90,110,80,100,80,95
Arcanine-Hisui,0.10677%,26928,Fire,Rock,95,115,80,95,80,90
Armarouge,0.70990%,14624,Fire,Psychic,85,60,100,125,80,75
Azelf,0.03180%,6141,Psychic,None,75,125,70,125,70,115
Azumarill,0.31674%,25317,Water,Fairy,100,50,80,60,80,50
Barraskewda,1.41862%,29742,Water,None,61,123,60,60,50,136
Basculegion,0.06161%,9203,Water,Ghost,120,112,65,80,75,78
Basculegion-F,0.03964%,4789,Water,Ghost,120,92,65,100,75,78
Bellibolt,0.08699%,6285,Electric,None,109,64,91,103,83,45
Blaziken,1.99050%,61528,Fire,Fighting,80,120,70,110,70,80
Blissey,14.57042%,83168,Normal,None,255,10,10,75,135,55

```
```bash
./pokemon_analysis.sh pokemon_usage.csv --sort speed
```
**Output:**
```
Pokemon,Usage%,RawUsage,Type1,Type2,HP,Atk,Def,SpAtk,SpDef,Speed
Deoxys-Speed,5.36610%,37835,Psychic,None,50,95,90,95,90,180
Dragapult,15.57184%,324719,Dragon,Ghost,88,120,75,100,75,142
Zamazenta,20.53205%,228136,Fighting,None,92,120,115,80,115,138
Barraskewda,1.41862%,29742,Water,None,61,123,60,60,50,136
Jolteon,0.65403%,13296,Electric,None,65,65,60,110,95,130
Talonflame,0.64136%,21754,Fire,Flying,78,81,71,74,69,126

```
**Kode revisi yang Digunakan:**
```bash
# Soal 4(b) Mengurutkan Pokemon berdasarkan data kolom
if [[ "$2" == "--sort" ]]; then
	COLUMN=$3
	case $COLUMN in
    	"usage")   SORT_FIELD=2; SORT_TYPE="numeric" ;;
    	"rawusage") SORT_FIELD=3; SORT_TYPE="numeric" ;;
    	"hp")  	SORT_FIELD=6; SORT_TYPE="numeric" ;;
    	"atk") 	SORT_FIELD=7; SORT_TYPE="numeric" ;;
    	"def") 	SORT_FIELD=8; SORT_TYPE="numeric" ;;
    	"spatk")   SORT_FIELD=9; SORT_TYPE="numeric" ;;
    	"spdef")   SORT_FIELD=10; SORT_TYPE="numeric" ;;
    	"speed")   SORT_FIELD=11; SORT_TYPE="numeric" ;;
    	"nama")	SORT_FIELD=1; SORT_TYPE="alphabetical" ;;
    	*)
        	echo "Error: Invalid column '$COLUMN'!"
        	exit 1
        	;;
	esac

	# Print header (baris pertama tetap ada)
	echo "$(head -n 1 "$1")"

	# Sorting berdasarkan jenis data
	if [[ "$SORT_TYPE" == "alphabetical" ]]; then
    	tail -n +2 "$1" | sort -t ',' -k1,1
	else
    	tail -n +2 "$1" | sort -t ',' -k"$SORT_FIELD","$SORT_FIELD"nr
	fi

	exit 0
fi

```

#### c) Mencari Nama Pokemon Tertentu
Fitur ini memungkinkan pengguna mencari statistik penggunaan Pokemon tertentu dengan hasil yang diurutkan berdasarkan **Usage%**.

**Perintah:**
```bash
./pokemon_analysis.sh pokemon_usage.csv --grep rotom
```
**Output:**
```
Pokemon,Usage%,RawUsage,Type1,Type2,HP,Atk,Def,SpAtk,SpDef,Speed
Rotom-Wash,1.62637%,71243,Electric,Water,50,65,107,105,107,86
```
**Kode yang Digunakan:**
```bash
# Soal 4(c) Mencari  nama Pokemon tertentu
if [[ "$2" == "--grep" ]]; then
    	echo "$(head -n 1 "$1")"
    	awk -F',' -v name="$3" 'NR == 1 || tolower($1) ~ tolower(name)' "$1" | sort -t ',' -k2,2nr
    	exit 0
fi

```

#### d) Mencari Pokemon Berdasarkan Filter Nama Type
Fitur ini digunakan untuk mencari Pokemon dengan tipe tertentu untuk menyusun "core" tim yang baik.

**Perintah:**
```bash
./pokemon_analysis.sh pokemon_usage.csv --filter dark
```
**Output:**
```
Pokemon,Usage%,RawUsage,Type1,Type2,HP,Atk,Def,SpAtk,SpDef,Speed
Ting-Lu,21.52833%,192107,Dark,Ground,155,110,125,55,80,45
Kingambit,21.27718%,412146,Dark,Steel,100,135,120,60,85,50
...
```
**Kode yang Digunakan:**
```bash
# Soal 4(d) Mencari Pokemon berdasarkan Type
if [[ "$2" == "--filter" ]]; then
    	# Cek apakah parameter type diberikan
    	if [[ -z "$3" ]]; then
    	echo "Error: no filter option provided"
    	echo "Use -h or --help for more information."
    	exit 1
    	fi

    	echo "$(head -n 1 "$1")"
    	awk -F',' -v type="$3" 'NR == 1 || tolower($4) == tolower(type) || tolower($5) == tolower(type)' "$1" | sort -t ',' -k2,2nr
    	exit 0
fi


```


#### e) Error Handling
Skrip ini dilengkapi dengan validasi kesalahan pengguna untuk memberikan kejelasan saat terjadi error.

**Contoh Kesalahan:**
```bash
./pokemon_analysis.sh pokemon_usage.csv --filter
```
**Output:**
```
Error: no filter option provided
Use -h or --help for more information
```

**Kode yang Digunakan:**
```bash
# Soal 4(e) Error Jika tidak ada perintah yang sesuai
echo "Error: Invalid command '$2'!"
echo "Use -h or --help for more information."
exit 1

```


#### f) Menampilkan Halaman Bantuan
Skrip ini menyediakan halaman bantuan yang jelas untuk memudahkan penggunaan.

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
  --info                : Menampilkan statistik Pokemon dengan penggunaan tertinggi.
  --sort <column>       : Mengurutkan Pokemon berdasarkan kolom tertentu.
  --grep <name>         : Mencari Pokemon berdasarkan nama.
  --filter <type>       : Menampilkan semua Pokemon berdasarkan Type1 atau Type2.
  -h, --help            : Menampilkan halaman bantuan ini.
============================================================
```
**Kode yang Digunakan:**
```bash
# Soal 4(f) Help screen untuk petunjuk pengerjaan
function show_help() {
    	cat << "EOF"

⠀⠀⠀⠀⠀⠀⣀⣠⣤⡔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⣧
⠀⠀⣀⣤⣶⣿⣿⣿⣿⣏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡾⠁⣼
⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⢷⣆⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡟⠀⠀⣿
⣾⣿⣿⣟⢛⣛⣛⣛⣋⠭⠥⠿⣿⣿⣷⣤⠀⠀⠀⢀⣀⣀⣠⣀⡀⢿⡇⠀⣸⡇
⣿⣿⣿⠻⢧⠙⢯⡀⠈⠉⠙⠛⠳⢦⣝⢿⣷⢠⣾⣿⣿⣿⣿⣿⣯⣬⡥⢰⡟⠀
⢹⣯⣛⠯⢿⣾⣷⣍⡳⣤⣀⠀⠀⠀⠉⠳⣍⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡃⠀⠀
⠈⠹⣿⣿⣾⣿⣿⣿⣿⣷⣭⣛⠷⢦⣤⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀
⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⢋⣵⡾⣣⣤⣦⢻⣿⣿⣿⣻⠻⣿⣿⣿⡏⠖⢻⠀⠀
⠀⠀⠀⠀⠀⠀⠈⠉⠉⣱⣿⡟⠼⣻⣿⣿⢸⣿⣿⡇⡛⠀⣿⣿⣿⣧⡠⣸⡇⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣷⢹⣿⣿⣿⣏⢿⣿⣷⣕⣧⣿⣿⣿⢿⣿⡿⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣠⢿⣿⡟⣿⣷⣭⣻⠿⢿⠿⠷⢞⣫⣵⠿⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⡟⣎⢿⣧⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⠁⠻⣷⡝⣩⣿⣿⣿⣿⣿⣿⣿⠿⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⠀⠀⠀⠀⣿⣿⣿⠉⠙⢻⢟⣿⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⡀⠀⠸⣿⣿⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⢿⡧⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀

POKEMON ANALYSIS TOOL
============================================================
Usage: ./pokemon_analysis.sh <file.csv> <command> [options]

Commands:
  --info            	: Menampilkan statistik Pokémon dengan penggunaan tertinggi.
  --sort <column>   	: Mengurutkan Pokémon berdasarkan kolom tertentu.  
                    	Kolom yang tersedia: usage, rawusage, hp, atk, def, spatk, spdef, speed, nama.
  --grep <name>     	: Mencari Pokémon berdasarkan nama (case insensitive).
  --filter <type>   	: Menampilkan semua Pokémon berdasarkan Type1 atau Type2.
  -h, --help        	: Menampilkan halaman bantuan ini.

Contoh Penggunaan:
  ./pokemon_analysis.sh pokemon_usage.csv --info
  ./pokemon_analysis.sh pokemon_usage.csv --sort usage
  ./pokemon_analysis.sh pokemon_usage.csv --grep pikachu
  ./pokemon_analysis.sh pokemon_usage.csv --filter fire

============================================================
EOF
    	exit 0
}
