#!/bin/bash

# Mengambil file pokemon_usage.csv
URL_FILE="https://drive.usercontent.google.com/download?id=1n-2n_ZOTMleqa8qZ2nB8ALAbGFyN4-LJ&export=download&authuser=0"
FILE="pokemon_usage.csv"

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

# Menampilkan bantuan jika argumen pertama adalah -h atau --help
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    	show_help
fi

# Menampilkan pesan error jika argumen kurang dari 2
if [[ $# -lt 2 ]]; then
    	echo "Error: Perintah tidak lengkap!"
    	echo "Use -h or --help for more information."
    	exit 1
fi

#Soal 4(a)  Menampilkan summary dari data
if [[ "$2" == "--info" ]]; then
    	HIGHEST_USAGE=$(awk -F',' 'NR > 1 {if ($2+0 > max) {max=$2; name=$1}} END {printf "%s with %.5f%%\n", name, max}' "$1")
    	HIGHEST_RAW_USAGE=$(awk -F',' 'NR > 1 {if ($3+0 > max) {max=$3; name=$1}} END {printf "%s with %d uses\n", name, max}' "$1")

    	echo "Summary of $1"
    	echo "Highest Adjusted Usage:  $HIGHEST_USAGE"
    	echo "Highest Raw Usage:    	$HIGHEST_RAW_USAGE"
    	exit 0
fi

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


# Soal 4(c) Mencari  nama Pokemon tertentu
if [[ "$2" == "--grep" ]]; then
    	echo "$(head -n 1 "$1")"
    	awk -F',' -v name="$3" 'NR == 1 || tolower($1) ~ tolower(name)' "$1" | sort -t ',' -k2,2nr
    	exit 0
fi

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


# Soal 4(e) Error Jika tidak ada perintah yang sesuai
echo "Error: Invalid command '$2'!"
echo "Use -h or --help for more information."
exit 1



