#!/bin/bash

#Code done by Venkata Srivani Yeduru
#Simple and basic password generator project 

#default password length

DEFAULT_LENGTH=12

#Character sets

LOWER="abcdefghijklmnopqrstuvwxyz"
UPPER="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
DIGITS="0123456789"
SPECIAL="!@#$%^&*()-_+="

#Function to display usage
usage() {
    echo "Usage: $0 [-l length] [-u] [-d] [-s]"
    echo " -l length  Length of the password (default: $DEFAULT_LENGTH)"
    echo " -u         Include uppercase letters"
    echo " -d         Include Digits"
    echo " -s         Include Special characters"
    exit 1
}

# Parse command line options
while getopts "l:uds" opt; do
   case $opt in
     l) LENGTH=$OPTARG ;;
     u) INCLUDE_UPPER=1 ;;
     d) INCLUDE_DIGITS=1 ;;
     s) INCLUDE_SPECIAL=1 ;;
     *) usage ;;
  esac
done

# Set password length

if [ -z "$LENGTH" ]; then
    LENGTH=$DEFAULT_LENGTH
fi

#Build Character set
CHARSET=$LOWER
if [ "$INCLUDE_UPPER" ]; then
   CHARSET+=$UPPER
fi

if [ "$INCLUDE_DIGITS" ]; then
   CHARSET+=$DIGITS
fi

if [ "$INCLUDE_SPECIAL" ]; then
   CHARSET+=$SPECIAL
fi

#Generate random password
PASSWORD=$(< /dev/urandom tr -dc "$CHARSET" | fold -w "$LENGTH" | head -n 1)

#Display the password
echo "Generated password: $PASSWORD"

