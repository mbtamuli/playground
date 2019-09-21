#!/usr/bin/env bash

# Echo PID of script
echo "PID: $$"

# Trap SIGTERM
trap "echo Booh! You can\'t just quit." SIGINT #SIGTERM

while true; do
    :
done

# Append the `.log` substring after removing the 
# `.sh` substring at the end of the script name
# PS - According to BashFAQ, $0 is not necessarily 
# the right way to access the script name
LOGFILE=${0%.*}.log
echo $LOGFILE

