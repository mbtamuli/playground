#!/bin/bash
#************************************************#
#                bootstap.sh                     #
#           written by Mriyam Tamuli             #
#                July 19, 2016                   #
#                                                #
#          Bootstrap Ubuntu 16.04 with           #
#              essential software.               #
#************************************************#

ROOT_UID=0
if [[ "$EUID" -ne "$ROOT_UID" ]]; then
   echo "This script must be run as root"
   exit 1
fi

LOGFILE=${0%.*}.log
ERRORFILE=${0%.*}.err

# For colored output.
RCol='\e[0m'    # Text Reset
Blu='\e[0;34m'
Gre='\e[0;32m'
Yel='\e[0;33m'
BBla='\e[1;30m'
URed='\e[4;31m'
On_Whi='\e[47m'

function install_i3
{
{
echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
apt-get update
apt-get --allow-unauthenticated install sur5r-keyring -y
apt-get update
apt-fast install i3 -y
} >>$LOGFILE 2>>$ERRORFILE
}

function install_ppas
{
    # Google Chrome
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -

    # webupd8 PPAs
    ppas=(atom brackets sublime-text-3 java)
    for ppa in "${ppas[@]}"; do
        add-apt-repository "ppa:webupd8team/$ppa" -y >>$LOGFILE 2>>$ERRORFILE
    done
}

function package_install
{
    for package in "${packages[@]}"; do
        echo -n "$package "
    done

    Update repos
    apt-get update >>$LOGFILE 2>>$ERRORFILE

    install_ppas

    Update repos
    apt-get update >>$LOGFILE 2>>$ERRORFILE

    Installing Java 8
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
    apt-fast install oracle-java8-installer -y >>$LOGFILE 2>>$ERRORFILE

    Installing packages
    apt-fast install vim sublime-text-installer brackets atom
    google-chrome-stable vlc mplayer zsh fortune boxes -y >>$LOGFILE 2>>$ERRORFILE

    install_i3

    echo
    pushd ~/TEMP
    runuser -l $SUDO_USER -c 'printf '%s\n%s' "https://releases.hashicorp.com/vagrant/1.8.5/vagrant_1.8.5_x86_64.deb" \
    "http://download.virtualbox.org/virtualbox/5.1.0/virtualbox-5.1_5.1.0-108711~Ubuntu~xenial_amd64.deb" \
    | aria2c -x10 -d ~/TEMP -i -'
    runuser -l $SUDO_USER -c 'printf "%s\n%s" "https://releases.hashicorp.com/vagrant/1.8.5/vagrant_1.8.5_SHA256SUMS" \
    "http://www.virtualbox.org/download/hashes/5.1.0/SHA256SUMS" | aria2c -x10 -d ~/TEMP -i -'
    virtualbox_check=$(sha256sum -c SHA256SUMS 2>&1 | grep OK | wc -l)
    vagrant_check=$(sha256sum -c vagrant_1.8.5_SHA256SUMS 2>&1 | grep OK | wc -l)
    popd
    
    if [[ $virtualbox_check -eq 1 ]]; then
        dpkg -i virtualbox-5.1_5.1.0-108711~Ubuntu~xenial_amd64.deb
    fi
    if [[ $vagrant_check -eq 1 ]]; then
        dpkg -i vagrant_1.8.5_x86_64.deb
    fi

    apt-fast install apt-transport-https ca-certificates -y
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | tee /etc/apt/sources.list.d/docker.list
    apt-get update
    apt-get install linux-image-extra-$(uname -r)
    apt-get install docker-engine
    groupadd docker
    usermod -aG docker $SUDO_USER
}

#################################################################################
#                                                                               #
#                           MAIN SCRIPT STARTS HERE                             #
#                                                                               #
#################################################################################

clear
echo -e "[${Blu}ACTION${RCol}]  Starting script"
echo -e "[${Blu}NOTICE${RCol}]  Hello, $SUDO_USER."
echo -e "[${Blu}NOTICE${RCol}]  Which of the following packages do you want to install? "
packages=(vim google-chrome oracle-java-8 atom brackets sublime-text-3 )
echo -e -n "[${Blu}NOTICE${RCol}]  "
i=1
for package in "${packages[@]}"; do
    echo -n "$i) $package "
    ((i++))
done
echo

echo "Enter a selection (default=all):"
while IFS= read -r line; do
    input_selection=("${input_selection[@]}" $line)
    if [[ $line = "" ]]; then
        break
    fi
done

if [[ ${#input_selection[@]} = 0 ]] || [[ ${#input_selection[@]} = ${#packages[@]} ]]; then
    printf '%s\n' "Installing all ${#packages[@]} packages."
    package_install ${#packages[@]}
else
    # TODO: Handle installation of select packages
    printf 'Installing '
    for i in "${input_selection[@]}"; do
        ((i--))
        printf '%s ' "${packages[$i]}"
    done
    package_install "${input_selection[@]}"
fi
echo
