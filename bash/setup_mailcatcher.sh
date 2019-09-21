#!/usr/bin/env bash

#************************************************#
#             setup_mailcatcher.sh               #
#           written by Mriyam Tamuli             #
#                 Dec 09, 2016                   #
#                                                #
#    Script to install Mailcatcher in Ubuntu.    #
#        Tested on Ubuntu 14.04, 16.04.          #
#************************************************#

if [[ "$EUID" -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

LOGFILE="/tmp/setup_mailcatcher.log"
ERRORFILE="/tmp/setup_mailcatcher.err"

{ 
    {
        apt-get update && apt-get install curl -y
        gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
        #installing rvm
        curl -sSL https://get.rvm.io | bash -s stable
        source /etc/profile.d/rvm.sh

        #install ruby 
        rvm install 2.3.1

        rvm use 2.3.1 --default

        echo "gem: --no-ri --no-rdoc" > ~/.gemrc

        #Finaly installing Mailcatcher 
        gem install mailcatcher
    } > >(tee "$LOGFILE" ); 
} 2> >(tee "$ERRORFILE" )

echo -e "[\e[4;31mACTION\e[0m] Run \`source /usr/local/rvm/scripts/rvm\`"
echo -e "[\e[0;34mNOTICE\e[0m] Check $LOGFILE and $ERRORFILE"
