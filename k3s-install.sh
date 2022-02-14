#!/usr/bin/env
OUTPUT="/tmp/input.txt"

# create empty file
>$OUTPUT
OUTPUT1="/tmp/k3sip.txt"

# create empty file
>$OUTPUT1
OUTPUT2="/tmp/sip.txt"

# create empty file
>$OUTPUT2
OUTPUT3="/tmp/pt.txt"

# create empty file
>$OUTPUT3
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="K3S installer"
TITLE="K3S installer"
MENU="Choose one of the following options:"
trap "rm $OUTPUT; exit" SIGHUP SIGINT SIGTERM

OPTIONS=(1 "Install Master"
         2 "Install Agent"
         3 "Stop k3s")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            curl -sfl https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -s;;
        2)
#setup Agent 1-----------------------------------------------------------------
dialog --title "$TITLE" \
--backtitle "$BACKTITLE" \
--inputbox "Enter K3s Token " 8 60 2>$OUTPUT 
respose=$?
#TOKEN
#TOKEN
#TOKEN
#TOKEN
#TOKEN
# get data stored in $OUPUT using input redirection
name=$(<$OUTPUT)

# make a decsion 
case $respose in
  0) 
  	 #setup agent 2-----------------------------------------------------------------------------
dialog --title "$TITLE" \
--backtitle "$BACKTITLE" \
--inputbox "Enter K3s Master IP " 8 60 2>$OUTPUT1
respose1=$?
#IP
#IP
#IP
#IP
#IP
#IP
#IP
# get data stored in $OUPUT using input redirection
name=$(<$OUTPUT1)
case $respose1 in
  0) 
  #setup 3 ------------------------------------------------------------------------------
 dialog --title "$TITLE" \
--backtitle "$BACKTITLE" \
--inputbox "Enter port (Defualt is 6443) " 8 60 2>$OUTPUT2
respose2=$?
#PORT
#PORT
#PORT
#PORT
#PORT
#PORT
#PORT

# get data stored in $OUPUT using input redirection
name=$(<$OUTPUT2)

# make a decsion 
case $respose2 in
  0) 
  	dialog --title "$TITLE" \
--backtitle "$BACKTITLE" \
--inputbox "Enter Agent Name " 8 60 2>$OUTPUT3
respose3=$?

# get data stored in $OUPUT using input redirection
name=$(<$OUTPUT3)
case $respose3 in
  0) 
 curl -sfL https://get.k3s.io | K3S_URL=https://${cat $OUTPUT1}:${cat $OUTPUT2} K3S_TOKEN=${cat $OUTPUT} K3S_NODE_NAME=${cat $OUTPUT3}  sh -;;
1)
clear
;;
esac

# get data stored in $OUPUT using input redirection
name=$(<$OUTPUT2)

# make a decsion 
case $respose2 in
  0) 
  	
  	;;
  1) 
  	echo "Cancel pressed." 
  	;;
  255) 
   echo "[ESC] key pressed."
esac
  	;;
  1) 
  	echo "Cancel pressed." 
  	;;
  255) 
   echo "[ESC] key pressed."
esac
#---------------------------------------------------------------
  	;;
  1) 
  	echo "Cancel pressed." 
  	;;
  255) 
   echo "[ESC] key pressed."
esac
  	;;
  1) 
  	clear 

  	;;
  255) 
   echo "[ESC] key pressed."
esac

# remove $OUTPUT file     
          ;;
        3)
            bash /usr/local/bin/k3s-killall.sh ;;
      
   
esac

