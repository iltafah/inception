#!/bin/bash

nc='\033[0m'

# Bold High Intensity
blc='\033[1;90m'      # Black
red='\033[1;91m'        # Red
grn='\033[1;92m'      # Green
yel='\033[1;93m'     # Yellow
blu='\033[1;94m'       # Blue
purp='\033[1;95m'     # Purple
cyan='\033[1;96m'       # Cyan
white='\033[1;97m'      # White

#special colors
scyan='\e[38;05;14m'
sblue='\e[38;05;39m'
sbrown='\e[38;05;82m'

#gradient colors
sc1='\e[38;05;154m'
sc2='\e[38;05;155m'
sc3='\e[38;05;156m'
sc4='\e[38;05;157m'
sc5='\e[38;05;158m'
sc6='\e[38;05;159m'

#echo "${cyan}  █████▒▄▄▄█████▓     ██████ ▓█████  ██▀███   ██▒   █▓ ██▓ ▄████▄  ▓█████   ██████ ";
#echo "▓██   ▒ ▓  ██▒ ▓▒   ▒██    ▒ ▓█   ▀ ▓██ ▒ ██▒▓██░   █▒▓██▒▒██▀ ▀█  ▓█   ▀ ▒██    ▒ ";
#echo "▒████ ░ ▒ ▓██░ ▒░   ░ ▓██▄   ▒███   ▓██ ░▄█ ▒ ▓██  █▒░▒██▒▒▓█    ▄ ▒███   ░ ▓██▄   ";
#echo "░▓█▒  ░ ░ ▓██▓ ░      ▒   ██▒▒▓█  ▄ ▒██▀▀█▄    ▒██ █░░░██░▒▓▓▄ ▄██▒▒▓█  ▄   ▒   ██▒";
#echo "░▒█░      ▒██▒ ░    ▒██████▒▒░▒████▒░██▓ ▒██▒   ▒▀█░  ░██░▒ ▓███▀ ░░▒████▒▒██████▒▒";
#echo " ▒ ░      ▒ ░░      ▒ ▒▓▒ ▒ ░░░ ▒░ ░░ ▒▓ ░▒▓░   ░ ▐░  ░▓  ░ ░▒ ▒  ░░░ ▒░ ░▒ ▒▓▒ ▒ ░";
#echo " ░          ░       ░ ░▒  ░ ░ ░ ░  ░  ░▒ ░ ▒░   ░ ░░   ▒ ░  ░  ▒    ░ ░  ░░ ░▒  ░ ░";
#echo " ░ ░      ░         ░  ░  ░     ░     ░░   ░      ░░   ▒ ░░           ░   ░  ░  ░  ";
#echo "                          ░     ░  ░   ░           ░   ░  ░ ░         ░  ░      ░  ";
#echo "                                                  ░       ░                        ";
#echo "${nc}"




lineclr=$(tput el)
line1=$(tput cuu1)
line2=$(tput cuu 2)
line3=$(tput cuu 3)
line4=$(tput cuu 4)
line5=$(tput cuu 5)
line6=$(tput cuu 6)
line7=$(tput cuu 7)

function loadbar () {
    
    start=5
    end=100
    bar_count=$((end / 5))
    #echo $bar_count
    #exit

    echo "${nc}    ---------- __o  "
    echo "   --------  _ \<,_ "
    echo " -------    (*)/ (*)"
    printf " Progress : |%${bar_count}s|[0]%%%2s\n"

    while [ $start -le $end ]; do
        bar_pos=$((start / 5))
        #fill=$(printf  "▇%.0s" $(seq 1 $bar_pos))
        fill=$(printf  "|%.0s" $(seq 1 $bar_pos))
        spaces=$((bar_count - bar_pos))

        printf "${cyan}"
        printf "${line4}${lineclr}%${bar_pos}s    ---------- __o  \n"
        printf "${lineclr}%${bar_pos}s   --------  _ \<,_ \n"
        printf "${lineclr}%${bar_pos}s -------    (*)/ (*)\n"           
        printf "${nc}"                                           
        printf "${lineclr}${purp}Progress : ${blu}|${grn}${fill}${nc}%${spaces}s${blu}|${nc}[${start}]${red}%%${nc}\n"
	((start+=$(($RANDOM % 5))))
        if [ $start -gt 95 ] && [ $start -lt 100 ] 
        then
		((start+=((100 - $start))))
        fi
        sleep $(printf %.1f "$(($RANDOM%5))e-1")
    done ;
    printf "${line4}${lineclr}\n${lineclr}\n${lineclr}\n${lineclr}\n${line4}"; #for some reason I couldn't make "tput ed" work on my mac"

}


function dockerfile_loadbar () {

    declare -A my_map

#    printf "${scyan}               .                                                               ${sc6}_\____ \n";
#    printf "${scyan}              ':'                                                             ${sc5}|_===__\`.        ==/ \n";
#    printf "${sblue}|\"\/\"|     ____${scyan}:${sblue}___                                                           ${sc4}\/  '---\"\ _ _ _ _/\n";
#    printf "${sblue} \  /    .\`📦📦    ',                                                   ${sc3}______/_______/_|_|_|_|_| \n";
#    printf "${sblue} |  \___/  📦📦  O  |                                                 ${sc2}_|📦📦📦📦📦📦📦📦📦📦==.\" \n";                                                              
#    printf "${scyan}~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^~^~^~${sc1}\____________________.'\n";               
#    printf "${purp}Progress : ${blu}|%s|[0]%%%2s\n"
    
#docker build requirements/nginx -t nginx --no-cache --progress plain  2> >(while read line; do if [[ $line =~ \[([0-9])/([0-9])\] ]]; then echo ${BASH_REMATCH[1]}; fi; done)

#    SUB='Step'
#    docker build requirements/$1 -t $1 --no-cache --progress plain 2> >(while read line ;
    docker compose build  --no-cache --progress plain > >(whlie read line ;
    do 
        #line=$(echo ${line} | grep -o 'Step [0-9]*/[0-9]*')
        #if [[ "$line" == *"$SUB"* ]];
        #if [[ "$line" =~ \[([0-9])/([0-9])\] ]];
        if [[ "$line" =~ \[(.+)([0-9])/([0-9])\] ]];
	then
            #start=$(echo ${line} |  grep -o "[0-9]*/[0-9]*" | grep -o '^[0-9]*')
            #end=$(echo ${line} |  grep -o "[0-9]*$")
           

#docker compose build  --no-cache --progress plain > >(declare -A my_map; while read line; do if [[ $line =~ \[(.+)([0-9])/([0-9])\] ]]; then my_map[${BASH_REMATCH[1]}]=${BASH_REMATCH[3]}; echo -n my_map[${BASH_REMATCH[1]}]; echo ${my_map[${BASH_REMATCH[1]}]};   fi; done)

    	    my_map[${BASH_REMATCH[1]}]=${BASH_REMATCH[2]}
	    echo my_map[${BASH_REMATCH[1]}]
	    echo
	    #if [[ ${BASH_REMATCH[2]} == 1 ]] then end+=${BASH_REMATCH[3]}

	    start=${BASH_REMATCH[2]}
   		
    	    end=${BASH_REMATCH[3]}

	    ratio=$((100 / end))
            if [ $start -ne $end ]
            then
                perc=$((start * ratio))
            else
                perc=100
            fi
            spaces=$((perc / 2))
            bar_count=$((100 / 5))
            bar_pos=$((perc / 5))
            bar_spaces=$((bar_count - bar_pos))
            #fill=$(printf  "▇%.0s" $(seq 1 $bar_pos))
#            fill=$(printf  "|%.0s" $(seq 1 $bar_pos))
            ship_spaces=$((49 - spaces))
#            printf "${line7}${lineclr}${scyan}%${spaces}s               .";                                     printf "%${ship_spaces}s              ${sc6}_\____ \n";                                
#            printf "${lineclr}${scyan}%${spaces}s              ':'";                                            printf "%${ship_spaces}s            ${sc5}|_===__\`.        ==/ \n";                       
#            printf "${lineclr}${sblue}%${spaces}s|\"\/\"|     ____${scyan}:${sblue}___";                        printf "%${ship_spaces}s          ${sc4}\/  '---\"\ _ _ _ _/\n";              
#            printf "${lineclr}%${spaces}s${sblue} \  /    .\`📦📦    ',";                                       printf "%${ship_spaces}s  ${sc3}______/_______/_|_|_|_|_| \n";                                             
#            printf "${lineclr}%${spaces}s${sblue} |  \___/  📦📦  O  |";                                        printf "%${ship_spaces}s${sc2}_|📦📦📦📦📦📦📦📦📦📦==.\" \n";                                         
#            printf "${lineclr}${scyan}~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^~^~^~"; printf "${sc1}\____________________.'\n";
#            printf "${lineclr}${purp}Progress : ${blu}|${grn}${fill}${nc}%${bar_spaces}s${blu}|${nc}[${perc}]${red}%%${nc}\n"
        fi
done;)
    printf a#"${line7}${lineclr}\n${lineclr}\n${lineclr}\n${lineclr}\n${lineclr}\n${lineclr}\n${lineclr}\n${line7}"; #for some reason I couldn't make "tput ed" work on my mac"

}


#loadbar
dockerfile_loadbar nginx
