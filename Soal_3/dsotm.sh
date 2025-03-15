#!/bin/bash

if [[ "$1" == --play=* ]]; then
    TRACK="${1#--play=}"
else
    echo "Gunakan: ./dsotm.sh --play=\"<Track>\""
    exit 1
fi

play_track() {
    case "$1" in
        "Speak to Me")
            curl -s https://raw.githubusercontent.com/annthurium/affirmations/refs/heads/main/affirmations.js | 
            sed '1d;$d' | sed -E 's/^[[:space:]]*"//;s/",?$//;' | grep -v '^\];$' | while IFS= read -r line; do
                echo "$line"
                sleep 1
            done
            ;;

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

        "Time")
            while true; do
                echo -ne "\r$(date '+%Y-%m-%d %H:%M:%S')"
                sleep 1
            done
            ;;

        "Money")
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
            ;;

        "Brain Damage")
            while true; do
                clear
                echo -e "\e[1;33mBrain Damage Task Manager - $(date '+%H:%M:%S')\e[0m"
                echo -e "\e[1;34mPID   USER      %CPU %MEM   VSZ   RSS COMMAND\e[0m"
                ps -eo pid,user,%cpu,%mem,vsz,rss,comm --sort=-%cpu | head -n 10
                sleep 1
            done
            ;;

        *)
            echo "Lagu tidak dikenali. Pilih: Speak to Me, On the Run, Time, Money, Brain Damage."
            exit 1
            ;;
    esac
}

play_track "$TRACK"
