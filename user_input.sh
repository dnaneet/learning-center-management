#!/bin/bash

#clear console screen
clear 

#Create feedback file name with date in file name

fdfile=feedback.$(date +"%B-%d-%Y").txt
if [ -e "$fdfile" ]; then
 echo " "
else 
    touch ./feedback.$(date +"%B-%d-%Y").txt
fi 

#touch feedback.$(date +"%b-%d-%y").txt

#Take user input and store in variable
echo -n "Enter your feedback and *then* press [ENTER].  Please remember to be respectful: "
read fd #User input (multi-line) is read and stored in variable fd
echo "$fd" >> feedback.$(date +"%B-%d-%Y").txt #contents of variable fd are saved to feedback.'date'.txt and a newline is inserted

echo "Thank you for your feedback.  The choice of service screen will now return in 5 seconds"
sleep 5s

#eof



