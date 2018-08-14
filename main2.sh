#!/bin/bash
#Main file that runs data collection code 23.sh in an infinite loop

stty intr ^g

function ctrl_c() {
        clear
	echo "** Trapped CTRL-C0"
	
	echo "'''''''''''''''''''''''''''''''''''''''"
        echo "Enter Admin password and click [ENTER]: "
        read -s passPhrase
	#trap "exit" SIGINT SIGTERM
        if [ $passPhrase == "fie2018" ]; then
                echo "Password valid.  Program will end in 5 seconds."
                for i in `seq 1 5`; do
                    sleep 1
                    echo -n "*."
                    #pkill 23.sh
                    #pkill main.sh
                done
	  	pkill main2.sh
        else
                echo "Incorrect pass phrase.  'Service Selection' screen will in 5 seconds load"
		for i in `seq 1 5`; do
		    sleep 1
		   echo -n "."
		done
                #./23.sh
        fi
}


trap ctrl_c INT


while :
do
	./24.sh
done
