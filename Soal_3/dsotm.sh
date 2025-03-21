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

        "On the Run")
            title_color=$((31 + RANDOM % 7))
            echo -ne "\e[1;${title_color}m╔════════════════════════════════╗\e[0m\n"
            echo -ne "\e[1;${title_color}m║          ON THE RUN           ║\e[0m\n"
            echo -ne "\e[1;${title_color}m╚════════════════════════════════╝\e[0m\n"
            echo -ne "\e[1;33mReady, set, go!\e[0m "
            progress=0
            while [ $progress -lt 100 ]; do
                progress=$((progress + RANDOM % 10))
                [ $progress -gt 100 ] && progress=100
                color=$((31 + RANDOM % 7))
                echo -ne "\r\e[1;${color}mReady, set, go! [$(printf '#%.0s' $(seq 1 $((progress / 2))))$(printf ' %.0s' $(seq 1 $((50 - progress / 2))))] $progress%\e[0m"
                sleep $(awk -v min=0.1 -v max=0.5 'BEGIN{srand(); print min+rand()*(max-min)}')
            done
            echo -e "\n\e[1;32mDone!\e[0m"
            ;;

        "Time")
            title_color=$((31 + RANDOM % 7))
            echo -ne "\e[1;${title_color}m╔════════════════════════╗\e[0m\n"
            echo -ne "\e[1;${title_color}m║          TIME          ║\e[0m\n"
            echo -ne "\e[1;${title_color}m╚════════════════════════╝\e[0m\n"
            while true; do
                color=$((31 + RANDOM % 7))
                echo -ne "\r\e[1;${color}m$(date '+%Y-%m-%d %H:%M:%S')\e[0m"
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
                            color=$((31 + RANDOM % 7))
                            printf "\e[1;${color}m%s\e[0m" "${symbols[RANDOM % ${#symbols[@]}]}"
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
                title_color=$((31 + RANDOM % 7))
                echo -e "\e[1;${title_color}m╔═════════════════════════════╗\e[0m"
                echo -e "\e[1;${title_color}m║       BRAIN DAMAGE        ║\e[0m"
                echo -e "\e[1;${title_color}m╚═════════════════════════════╝\e[0m"
                color=$((31 + RANDOM % 7))
                echo -e "\e[1;${color}mBrain Damage Task Manager - $(date '+%H:%M:%S')\e[0m"
                echo -e "\e[1;34mPID   USER      %CPU %MEM   VSZ   RSS COMMAND\e[0m"
                ps -eo pid,user,%cpu,%mem,vsz,rss,comm --sort=-%cpu | head -n 10 | while IFS= read -r line; do
                    color=$((31 + RANDOM % 7))
                    echo -e "\e[1;${color}m$line\e[0m"
                done
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
