#!/bin/bash

# Vars, NADA is not a girl name btw
img_arr=NADA
start_steps_arr=NADA
end_steps_arr=NADA
start=0
end=100
exit_code=1

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

lineclr=$(tput el)
line1=$(tput cuu1)
line2=$(tput cuu 2)
line3=$(tput cuu 3)
line4=$(tput cuu 4)
line5=$(tput cuu 5)
line6=$(tput cuu 6)
line7=$(tput cuu 7)
hideCurs=$(tput civis)
restoreCurs=$(tput cnorm)

function print_image_arr () {

    echo {Img arr:} >> debugFile
    for i in ${!img_arr[@]}; do
        echo ">" ${img_arr[$i]} ":" ${end_steps_arr[$i]} >> debugFile
    done
    echo {===============} >> debugFile
    return 0;
}

function get_curr_steps () {

    # given_img=$1
    # echo {start steps:} >> debugFile
    curr_steps=0
    for i in ${!start_steps_arr[@]}; do
        # echo ${start_steps_arr[$i]} >> debugFile
        curr_steps=$(($curr_steps + ${start_steps_arr[$i]} ))    
    done
    # echo {===============} >> debugFile
    return $curr_steps
}

function get_end_steps () {

    # given_img=$1
    # echo {end steps:} >> debugFile
    end_steps=0
    for i in ${!start_steps_arr[@]}; do
        # echo ${start_steps_arr[$i]} >> debugFile
        end_steps=$(($end_steps + ${end_steps_arr[$i]} ))    
    done
    # echo {===============} >> debugFile
    return $end_steps
}

function add_image () {
    
    new_img=$1
    start_step=$2
    end_step=$3

    for i in ${!img_arr[@]}; do
        if [[ $new_img == ${img_arr[$i]} ]]
        then
            # Those focking shi2 r not stable, that's y I update them
            # They r the reason for the waves in the ocean that make my poor whale back off
            start_steps_arr[$i]=$start_step
            end_steps_arr[$i]=$end_step
            return 1
        fi
    done
    img_arr+=( $new_img )
    start_steps_arr+=( $start_step )
    end_steps_arr+=( $end_step )

    return 0;
}

function dockerfile_loadbar () {

    waves_index=0

    printf "${scyan}               .                                                               ${sc6}_\____ \n";
    printf "${scyan}              ':'                                                             ${sc5}|_===__\`.        ==/ \n";
    printf "${sblue}|\"\/\"|     ____${scyan}:${sblue}___                                                           ${sc4}\/  '---\"\ _ _ _ _/\n";
    printf "${sblue} \  /    .\`📦📦    ',                                                   ${sc3}______/_______/_|_|_|_|_| \n";
    printf "${sblue} |  \___/  📦📦  O  |                                                 ${sc2}_|📦📦📦📦📦📦📦📦📦📦===.\" \n";                                                              
    printf "${scyan}~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^~^~^~ ${sc1}\____________________.'\n";               
    printf "${purp}Progress : ${blu}|%s|[0]%%%2s\n"
    

    while read line ; do 
        echo $line >> debugFile
        if [[ "$line" =~ \[(.*)\ *([0-9])/([0-9])\] ]];
	    then
            sleep 1 # For الجمالية
            last_step=$line
            img_name=${BASH_REMATCH[1]}
            curr_step=${BASH_REMATCH[2]}
            last_step=${BASH_REMATCH[3]}
            if [[ $img_name == "" ]]; then img_name="uWu"; fi;

            add_image $img_name $curr_step $last_step #"${img_arr[@]}"
            # print_image_arr
            get_curr_steps
            start=$?
            get_end_steps
            end=$?

	        ratio=$((100 / end))
            if [ $start -ne $end ]; then perc=$((start * ratio)); else perc=100; fi;
            pre_spaces=$(($perc * 49 / 100)) # 49 is the number of spaces between the whale and the ship
            bar_count=$((100 / 10))
            bar_pos=$((perc / 5))
            bar_spaces=$((bar_count*2 - bar_pos))
            fill=$(printf  "▇%.0s" $(seq 1 $bar_pos))
            ship_spaces=$((49 - pre_spaces)) # expected spaces between the whale and the ship

            printf "${line7}${lineclr}${scyan}%${pre_spaces}s               .";                                     printf "%${ship_spaces}s              ${sc6}_\____ \n";                                
            printf "${lineclr}${scyan}%${pre_spaces}s              ':'";                                            printf "%${ship_spaces}s            ${sc5}|_===__\`.        ==/ \n";                       
            printf "${lineclr}${sblue}%${pre_spaces}s|\"\/\"|     ____${scyan}:${sblue}___";                        printf "%${ship_spaces}s          ${sc4}\/  '---\"\ _ _ _ _/\n";              
            printf "${lineclr}%${pre_spaces}s${sblue} \  /    .\`📦📦    ',";                                       printf "%${ship_spaces}s  ${sc3}______/_______/_|_|_|_|_| \n";                                             
            printf "${lineclr}%${pre_spaces}s${sblue} |  \___/  📦📦  O  |";                                        printf "%${ship_spaces}s${sc2}_|📦📦📦📦📦📦📦📦📦📦===.\" \n";                                         
            printf "${lineclr}${scyan}~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^~^~^~^"; printf " ${sc1}\____________________.'\n";
            printf "${lineclr}${purp}Progress : ${blu}|${grn}${fill}${nc}%${bar_spaces}s${blu}|${nc}[${perc}]${red}%%${nc}\n"

            #just to move the prefix from the steps line which is `(#[0-9]+ )`
            curr_step_line=`echo $line | sed -E 's/(^#[0-9]+\ )(.+)|.*/\2/'` # <<<= for example : #25 [wordpress 9/9] RUN uWu 
            curr_step_line_len=${#line}
            if [[ $curr_step_line_len -gt  50 ]];
            then
                curr_step_line=${curr_step_line:0:50}
                curr_step_line+="..."
            fi
            printf "\n${lineclr}${white}${curr_step_line}${nc}\n\n" # <<<= note new lines for separating

            for (( indx=1; indx<${#img_arr[@]}; indx++ )); do
                bar_count=$(( ${end_steps_arr[$indx]}  ))
                bar_pos=$(( ${start_steps_arr[$indx]}  ))
                bar_spaces=$((bar_count - bar_pos))
                fill=$(printf  ".%.0s" $(seq 1 $bar_pos))
                printf "${lineclr}${yel}${img_arr[$indx]} : ${blu}|${grn}${fill}${nc}%${bar_spaces}s${blu}|${nc}[${start_steps_arr[$indx]}/${end_steps_arr[$indx]}]${red}${nc}\n"
            done


            for (( indx=1; indx<${#img_arr[@]}; indx++ )); do
                printf "${line1}";
                if [[ $perc -eq 100 ]];
                then
                    printf "${lineclr}";
                fi;
            done

            printf "${line1}${line1}${line1}"           # <<<<= just move the cursor above the separated lines so yeah it has to be hard coded
        

        #I THINK I'll Have to save the lines too of a given step so I can know where the error
# > [wordpress 6/9] RUN chmod +x wp-cli.phar && mv wp-cli.phar:
# #22 0.276 Usage: mv [-finT] SOURCE DEST
# #22 0.276 or: mv [-fin] SOURCE... { -t DIRECTORY | DIRECTORY }
# #22 0.276
# #22 0.276 Rename SOURCE to DEST, or move SOURCEs to DIRECTORY
# #22 0.276
# #22 0.276 -f Don't prompt before overwriting
# #22 0.276 -i Interactive, prompt before overwrite
# #22 0.276 -n Don't overwrite an existing file
# #22 0.276 -T Refuse to move if DEST is a directory
# #22 0.276 -t DIR Move all SOURCEs into DIR

        elif [[ "$line" =~ (failed to solve:)(.+:)(.+:.+)([0-9]+) ]];
        then
            printf "\n${white}${last_step}${nc}\n"
            printf "${lineclr}${red}${BASH_REMATCH[1]}${yel}${BASH_REMATCH[2]}${cyan}${BASH_REMATCH[3]}${red}${BASH_REMATCH[4]}${nc}\n"
            for (( indx=1; indx<${#img_arr[@]}; indx++ )); do
                printf "${lineclr}\n"
            done
            for (( indx=1; indx<${#img_arr[@]}; indx++ )); do
                printf "${line1}"
            done
            printf "${restoreCurs}"
            exit 1
        fi;

        waves_index=$(($waves_index + 1))
        if [ $(($waves_index % 2)) -eq 0 ]
        then
            printf "${line2}${lineclr}${scyan}~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^~^~^~^"; printf " ${sc1}\____________________.'\n\n";
        else
            printf "${line2}${lineclr}${scyan}^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^~^~^~"; printf " ${sc1}\____________________.'\n\n";
        fi
    done;

}


# Main() Func; Or Not?
printf "${hideCurs}"
dockerfile_loadbar
printf "${restoreCurs}"
if [[ $perc -eq 0 ]]; then printf "${red}Bro Go And Turn On The Docker Deamon${nc}\n"; exit 1; fi