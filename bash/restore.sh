#!/bin/bash
#************************************************#
#                  backup.sh                     #
#           written by Mriyam Tamuli             #
#                July 17, 2016                   #
#                                                #
#         Back up data to external HDD.          #
#************************************************#

LOGFILE=backup.log
ERRORFILE=backup.err

RCol='\e[0m'    # Text Reset
Blu='\e[0;34m'
Gre='\e[0;32m'
Yel='\e[0;33m'
BBla='\e[1;30m'
URed='\e[4;31m'
On_Whi='\e[47m'

# TODO: Add logic to check if rsync can be used.
COPY_PROG='rsync'
RSYNC_FLAGS='azvP'

#################################################################################
#                                                                               #
#                           MAIN SCRIPT STARTS HERE                             #
#                                                                               #
#################################################################################

clear
echo -e "[${Blu}ACTION${RCol}]  Starting script"
echo -e "[${Blu}NOTICE${RCol}]  Hello, $USER."
echo -e -n "[${Blu}NOTICE${RCol}]  Enter the path of the external HDD and press [ENTER]: "
read backup_drive

# TODO: Ask user at runtime or at least show a default set of locations to backup
# and provide option to add/remove locations from the default set.

source_array=(Documents Downloads Entertaintment Pictures Music workspace)
destination_array=(Documents Downloads Entertaintment Pictures Music workspace)
for i in "${source_array[@]}"; do
    $COPY_PROG -$RSYNC_FLAGS $backup_drive/Backup/$i/* $HOME/$i/ | tee -a output
done

echo
echo
echo -e "[${Gre}NOTICE${RCol}]  ${BBla}${On_Whi}Backup Complete${RCol}."
echo
echo
