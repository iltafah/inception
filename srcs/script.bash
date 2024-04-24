#!/bin/bash

img_arr=NADA
start_steps_arr=NADA
end_steps_arr=NADA
start=0
end=100

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

function print_image_arr () {

    echo {Img arr:} >> file
    for i in ${!img_arr[@]}; do
        echo ">" ${img_arr[$i]} ":" ${end_steps_arr[$i]} >> file
    done
    echo {===============} >> file
    return 0;
}

function get_curr_steps () {

    # given_img=$1
    echo {start steps:} >> file
    curr_steps=0
    for i in ${!start_steps_arr[@]}; do
        echo ${start_steps_arr[$i]} >> file
        curr_steps=$(($curr_steps + ${start_steps_arr[$i]} ))    
    done
    echo {===============} >> file
    return $curr_steps
}

function get_end_steps () {

    # given_img=$1
    echo {end steps:} >> file
    end_steps=0
    for i in ${!start_steps_arr[@]}; do
        echo ${start_steps_arr[$i]} >> file
        end_steps=$(($end_steps + ${end_steps_arr[$i]} ))    
    done
    echo {===============} >> file
    return $end_steps
}

# function find_image () {
    
#     # shift 1
#     # local img_arr=$@
#     # line="blah blah xd"

#     # my_map=(meow blah)
#     # my_map+=( "uwu" )
#     # my_map+=($line)
#     i=0
#     for i in ${!img_arr[@]}; do
#         echo ">" ${img_arr[$i]}
#         # if [[ $1 == ${img_arr[$i]} ]]
#     done
#     echo {the element found above}
#     return 0;
# }

function add_image () {
    
    new_img=$1
    start_step=$2
    end_step=$3
    # shift 2
    # img_arr=$@
    # line="blah blah xd"

    # my_map=(meow blah)
    # my_map+=( "uwu" )
    # my_map+=($line)
    # echo new image : $new_img
    for i in ${!img_arr[@]}; do
        #echo ${img_arr[$i]}
        if [[ $new_img == ${img_arr[$i]} ]]
        then
            # delete=$new_img
            # echo ${img_arr[@]/$delete}
            # img_arr=( "${img_arr[@]/$new_img}" ) #delete image even if it makes no sense, but later u will append the image with start and end
            # img_arr+=( $new_img ) #add image
            
            #Those focking shi2 r not stable, that's y I update them
            #They r the reason for the waves in the ocean that make my poor whale back off
            start_steps_arr[$i]=$start_step
            end_steps_arr[$i]=$end_step
            # echo end inside a loop
            return 1
        fi
    done
    img_arr+=( $new_img )
    start_steps_arr+=( $start_step )
    end_steps_arr+=( $end_step )
    # echo $end
    # echo $end_step
    # end=$(($end + $end_step))
    # echo $end
    # echo ====================
    return 0;
}

function dockerfile_loadbar () {

    # img_arr=( "a" )
    # my_map=(meow blah)
    # my_map+=( "uwu" )
    waves_index=0

   printf "${scyan}               .                                                               ${sc6}_\____ \n";
   printf "${scyan}              ':'                                                             ${sc5}|_===__\`.        ==/ \n";
   printf "${sblue}|\"\/\"|     ____${scyan}:${sblue}___                                                           ${sc4}\/  '---\"\ _ _ _ _/\n";
   printf "${sblue} \  /    .\`📦📦    ',                                                   ${sc3}______/_______/_|_|_|_|_| \n";
   printf "${sblue} |  \___/  📦📦  O  |                                                 ${sc2}_|📦📦📦📦📦📦📦📦📦📦===.\" \n";                                                              
   printf "${scyan}~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^~^~^~ ${sc1}\____________________.'\n";               
   printf "${purp}Progress : ${blu}|%s|[0]%%%2s\n"
    
#docker build requirements/nginx -t nginx --no-cache --progress plain  2> >(while read line; do if [[ $line =~ \[([0-9])/([0-9])\] ]]; then echo ${BASH_REMATCH[1]}; fi; done)

#    SUB='Step'
#    docker build requirements/$1 -t $1 --no-cache --progress plain 2> >(while read line ;
    docker compose build  --no-cache --progress plain 2>/dev/null | while read line ; do 
        #line=$(echo ${line} | grep -o 'Step [0-9]*/[0-9]*')
        #if [[ "$line" == *"$SUB"* ]];
        #if [[ "$line" =~ \[([0-9])/([0-9])\] ]];
        if [[ "$line" =~ \[(.+)\ ([0-9])/([0-9])\] ]];
	    then
            #start=$(echo ${line} |  grep -o "[0-9]*/[0-9]*" | grep -o '^[0-9]*')
            #end=$(echo ${line} |  grep -o "[0-9]*$")
           

echo $line >> file
        # //firstly you will have to update the arr, if the image element doesn't exist
        # //so let's implement our search function
        # my_map+=( ${BASH_REMATCH[1]} )
        add_image ${BASH_REMATCH[1]} ${BASH_REMATCH[2]} ${BASH_REMATCH[3]} #"${img_arr[@]}"
        print_image_arr
        get_curr_steps
        start=$?
        get_end_steps
        end=$?
#docker compose build  --no-cache --progress plain > >(declare -A my_map; while read line; do if [[ $line =~ \[(.+)([0-9])/([0-9])\] ]]; then my_map[${BASH_REMATCH[1]}]=${BASH_REMATCH[3]}; echo -n my_map[${BASH_REMATCH[1]}]; echo ${my_map[${BASH_REMATCH[1]}]};   fi; done)

    	#     my_map[${BASH_REMATCH[1]}]=${BASH_REMATCH[3]}
	    # echo my_map[${BASH_REMATCH[1]}] '=' ${my_map[${BASH_REMATCH[1]}]}
        # echo ${BASH_REMATCH[1]}
        # for key in "${!my_map[@]}"
        # do printf "[%q]=%d\n" "$key" "${my_map[$key]}"; done
            # do echo "Key: $key Value: ${my_map[$key]}"; done
	    # if [[ ${BASH_REMATCH[2]} == 1 ]] then end+=${BASH_REMATCH[3]}

	    # start=${BASH_REMATCH[2]}
   		
    	# end=${BASH_REMATCH[3]}
echo start : "<<<<$start>>>>>" >> file
echo end : "<<<<$end>>>>>" >> file
echo >> file

	    ratio=$((100 / end))
            if [ $start -ne $end ]
            then
                perc=$((start * ratio))
            else
                perc=100
            fi;
            spaces=$((perc / 2))
            echo spaces: $spaces >> file
            bar_count=$((100 / 5))
            bar_pos=$((perc / 5))
            bar_spaces=$((bar_count - bar_pos))
            #fill=$(printf  "▇%.0s" $(seq 1 $bar_pos))
           fill=$(printf  "|%.0s" $(seq 1 $bar_pos))
            ship_spaces=$((50 - spaces)) #expected spaces between the whale and the ship
           printf "${line7}${lineclr}${scyan}%${spaces}s               .";                                     printf "%${ship_spaces}s              ${sc6}_\____ \n";                                
           printf "${lineclr}${scyan}%${spaces}s              ':'";                                            printf "%${ship_spaces}s            ${sc5}|_===__\`.        ==/ \n";                       
           printf "${lineclr}${sblue}%${spaces}s|\"\/\"|     ____${scyan}:${sblue}___";                        printf "%${ship_spaces}s          ${sc4}\/  '---\"\ _ _ _ _/\n";              
           printf "${lineclr}%${spaces}s${sblue} \  /    .\`📦📦    ',";                                       printf "%${ship_spaces}s  ${sc3}______/_______/_|_|_|_|_| \n";                                             
           printf "${lineclr}%${spaces}s${sblue} |  \___/  📦📦  O  |";                                        printf "%${ship_spaces}s${sc2}_|📦📦📦📦📦📦📦📦📦📦===.\" \n";                                         
           printf "${lineclr}${scyan}~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^~^~^~^"; printf " ${sc1}\____________________.'\n";
           printf "${lineclr}${purp}Progress : ${blu}|${grn}${fill}${nc}%${bar_spaces}s${blu}|${nc}[${perc}]${red}%%${nc}\n"
        fi;

        waves_index=$(($waves_index + 1))
        echo waves index : $waves_index >> file
        if [ $(($waves_index % 4)) -eq 0 ]
        then
            printf "${line2}${lineclr}${scyan}~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^~^~^~^"; printf " ${sc1}\____________________.'\n\n";
        else
            printf "${line2}${lineclr}${scyan}^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^~^~^~"; printf " ${sc1}\____________________.'\n\n";
        fi
done;
    # printf "${line7}${lineclr}\n${lineclr}\n${lineclr}\n${lineclr}\n${lineclr}\n${lineclr}\n${lineclr}\n${line7}"; #for some reason I couldn't make "tput ed" work on my mac"

}


# loadbar
dockerfile_loadbar
# find_image
