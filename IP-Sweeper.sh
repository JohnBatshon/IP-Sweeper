#!/bin/bash

# This checks to see if the user put in an IP address in the first argument ($1)
# If the user failed to do so correctly the following error message will print.

if [ "$1 == "" ]
then
echo "You forgot an IP Address!"
echo "Syntax: ./ipsweep.sh"

# Otherwise if the user put in the correct syntax then the following will proceed.
# For every IP in the range of 1 through 254 run this command. This command
# will cycle through the number range and ping all IP addresses to see if a
# device responds.

else
for ip in `seq 1 254`; do
ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done
fi