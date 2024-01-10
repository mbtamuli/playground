# Cache http credentials for one day while pull/push
git config --global credential.helper 'cache --timeout=86400'


# Create any number of files
touch hello{1..10}
# Add some text to those files
for i in {1..10}; do echo "Hello World" > hello${i}; done


# Access argument of last used command
mkdir new && cd $_
# In this case $_ = new

# Install packages from a folder in Ubuntu
for i in `ls path/to/folder`; do sudo dpkg -i /path/of/folder/$i; done

# Specific use case for regex.
# May not be much useful
# Put the list of vagrant boxes in list
vagrant box list > list
# The format of each line 	-> laravel/homestead    (virtualbox, 0.2.7)
# The format I required		-> laravel/homestead
												^no space here
# This is the command with which I reached that
sed -i -n 's/[ ]*\((\).*\()\)//p' list
# This list
# 	drifty/ionic-android
# 	laravel/homestead
# 	ubuntu/precise64
# 	ubuntu/trusty64
# 	ubuntu/trusty64-juju
#
# To make folder I replaced '/' with '-'
sed -i -n 's/\//-/p' list
# Became this list
# 	drifty-ionic-android
# 	laravel-homestead
# 	ubuntu-precise64
# 	ubuntu-trusty64
# 	ubuntu-trusty64-juju
# 	ubuntu-vivid64
#
# Vagrant init in each folder for the list
for i in `cat list`; do mkdir $i && cd $_; vagrant init `echo $i | sed -n 's/-/\//p'`; cd ..; done;
#	.
#	├── drifty-ionic-android
#	│   └── Vagrantfile
#	├── laravel-homestead
#	│   └── Vagrantfile
#	├── list
#	├── ubuntu-precise64
#	│   └── Vagrantfile
#	├── ubuntu-trusty64
#	│   └── Vagrantfile
#	├── ubuntu-trusty64-juju
#	│   └── Vagrantfile
#	└── ubuntu-vivid64
#	    └── Vagrantfile

# One more tough regex (:P) in renaming
# Changing downloaded tutorials

# ORIGINAL - [20150511][_P24mASZXHE] OpenStack Kilo - Installation on Ubuntu 15.04 ( Basic Environment ) (by chaal pritam).mp4
# REQUIRED - OpenStack Kilo - Installation on Ubuntu 15.04 Dashboard - Horizon.mp4
rename -v -n 's/(\[\d*\])(\[\w*\])([\s|\w]*-[\s|\w|\.]*)\(\s([\w|\s|\-]*)\s\)(.*)/$3$4.mp4/' *
rename -v 's/(\.04\s)([\w|\s]*)(\..*)/($2).mp4/g' *

# Copy a file to a remote machine
scp -P 2222 file.ext username@domain:~/

# Generate a new SSH key
ssh-keygen -t ed25519 -C "$(whoami)@$(uname -n)-$(date -I)"
ssh-keygen -t rsa -b 4096 -C "mbtamuli@gmail.com"
# Generate public key from private key
ssh-keygen -f <private_key> -y > <public_key>
# For example
ssh-keygen -f ~/.ssh/id_rsa -y > ~/.ssh/id_rsa.pub

# Select fields from a line
echo "One Two Three Four" | cut -f2,3 -d" "
OUTPUT: Two Three

# Check SHA256sums
sha256sum Fedora-Live-Workstation-x86_64-22-3.iso | cut -d " " -f1 | awk '{print ($1 == "615abfc89709a46a078dd1d39638019aa66f62b0ff8325334f1af100551bb6cf") ? "true" : "false" }'

# Rename video files to the same name as the srt files.
# example -
# Mr.Robot.S01E02.HDTV.x264-KILLERS.mp4
# Mr. Robot - 01x02 - eps1.1_ones-and-zer0es.srt

# OUTPUT
# Mr. Robot - 01x02 - eps1.1_ones-and-zer0es.mp4
# Mr. Robot - 01x02 - eps1.1_ones-and-zer0es.srt
for f in  Mr.Robot.S01E0*; do E="${f#*E}"; E="${E%%.*}"; file=( *" 01x$E "* ); echo mv "$f" "${file/.srt/}.${f##*.}"; done

## My posible explanation
for f in  Mr.Robot.S01E0*;
# Mr.Robot.S01E01.HDTV.x264-KILLERS.mp4
do E="${f#*E}";
# 01.HDTV.x264-KILLERS.mp4
	E="${E%%.*}";
	# 01
	file=( *" 01x$E "* );
	# Mr. Robot - 01x02 - eps1.1_ones-and-zer0es.srt
	echo mv "$f" "${file/.srt/}.${f##*.}";
	# "# Mr.Robot.S01E01.HDTV.x264-KILLERS.mp4" "Mr. Robot - 01x02 - eps1.1_ones-and-zer0es.mp4"
done

# Find public ip address from terminal
curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'

# VPN using tunneling
sshuttle -r username@host 0/0 -vv

# Mirror a site
nohup wget --limit-rate=200k --no-clobber --convert-links --random-wait -r -p -E -e robots=off -U mozilla http://www.example.com &

# Create an AP
create_ap --driver nl80211 wlxc46e1f189960 wlo1 lalala wifi1234

# Get another instance of a container's shell
docker exec -it <name> /bin/bash

# Docker container using apt-cacher-ng
RUN  echo 'Acquire::http { Proxy "http://dockerhost:3142"; };' >> /etc/apt/apt.conf.d/01proxy

# MongoDB Container
docker run -p 27017:27017 --name db -v /home/mbtamuli/workspace/virtual/docker/datadir:/data/db -d mongo

# youtube-dl
youtube-dl "{insert_playlist_url}" -o "%(autonumber)s-%(title)s.%(ext)s" --autonumber-size 2

# Find files in current directory excluding dotfiles
find . -maxdepth 1 -type f -regex "./[^.].*"
# ./MyGuide.txt ./hist.txt ./list_of_installed_packages.txt ./install_arch.sh

# Check IP Address with port 22 open
nmap $target -oG - | awk '/ 22\/open\/tcp/{print $2}'
nmap -p 22 -oX - $target | xmllint --xpath '//port[@portid="22"]/state[@state="open"]/../../../address/@addr' -

# Remove all dangling Docker Volumes
docker volume rm $(docker volume ls -qf dangling=true)
# Remove all containers
# -a lists all containers
# -q lists containers by ID
# Finally docker rm removes containers
docker rm $(docker ps -a -q)

# Unzip multiple files in parallel processes
find . -maxdepth 1 -name '*.zip' -print0 | xargs -0 -I {} -P 10 unzip {}

# Pull multiple docker images
printf '%s\n%s' "ubuntu" "nginx" | xargs -0 -I {} -P 10 docker pull {}

# If an installation requires you to add a user to a group and logout and login again
# You can do
newgrp {group}
# So that you don't have to logout and login

# To recover the OP status for the channel
/msg ChanServ IDENTIFY <channel-name> <password>

# To check the IP address of a container.
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container-name>

# To mount a disk to be writable by non-root user
sudo mount /dev/sda1 -o gid=$USER,uid=$USER,fmask=113,dmask=002 /mnt/usbstick

# add eax, ebx and store result in eax in assembly, hexadecimal and binary
[add eax, ebx] = [03 C3] = [00000011 11000011]

# Convert video to audio
ffmpeg -i video.mp4 -vn -acodec libmp3lame -ac 2 -ab 160k -ar 48000 audio.mp3

# Combine video and audio
ffmpeg -y -i 'file:video.mp4' -i 'file:audio.m4a' -c copy -map 0:v:0 -map 1:a:0 'file:output.mp4'

# Find files of given type and sort. For creating playlist for mplayer
find -maxdepth 1 -type f -iregex ".*\.\(webm\|mkv\|mp4\|\)$" | sort > playlist
# Same as above but reverse sort
find -maxdepth 1 -type f -iregex ".*\.\(webm\|mkv\|mp4\|\)$" | sort -r > playlist
# Same as above but use modification date instead of filename
find -maxdepth 1 -type f -iregex ".*\.\(webm\|mkv\|mp4\|\)$" -printf "%T+\t%p\n" | sort | tail -n 5 > playlist

# This example was useful to find and delete files with a specific string.
# I was going through this https://github.com/dtan4/terraforming#example-export-all
# and needed to delete the empty files.
# But instead of modifying the not easily parsable output of the given find command, I found out I could use
# the following to delete the empty files(even files with just space).
grep -rLZ "$str" . | while IFS= read -rd '' x; do rm "$x"; done
find . -type f -print0 | xargs --null grep -Z -L 'my string' | xargs --null rm

# Convert mp4 into gif
# requires ffmpeg and imagemagick installed
ffmpeg -i input.mp4 -vf scale=320:-1 -r 10 -f image2pipe -vcodec ppm - | \
  convert -delay 5 -loop 0 - output.gif

# flatten the directory
find /source-tree -type f -exec cp {} /target-dir \;

# Find text only files
find . -type f -exec grep -Iq . {} \; -and -print

# Split a large file into smaller pieces
# This splits a file called `foo` into multiple files with `bar.` prefix.
# Like bar.000, bar.001, etc
split --bytes 500M --numeric-suffixes --suffix-length=3 foo bar.

# To recombine, we can use
find -maxdepth 1 -type f -name 'bar*'  | sort | xargs cat > foo

# Create a file of 1 KiB with random text
base64 /dev/urandom | head -c 10240 > file.txt
# Create 10 files of 1 KiB with random text
for i in {1..10}; do base64 /dev/urandom | head -c 10000 > file"$i".txt; do

# Clip a part of the whole video
ffmpeg -i full.mp4 -ss 00:00:03 -t 00:00:08 -codec copy -async 1 clip.mp4
-ss 00:12:44 -t 00:01:12 -codec copy -async 1 clip.mp4

# Reverse SSH Tunnel creation
ssh -f -N -T -R22222:localhost:22 yourpublichost.example.com
# reverse SSH tunnel connect
ssh -p 22222 username@localhost

# Wait until a URL is reachable
while ! curl --output /dev/null --silent --head --fail "https://example.com/help"; do sleep 1 && echo -n .; done

# docker inspect IP
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name_or_id

# Aria2 start rpc (for use with YAAW) and save session
aria2c --enable-rpc --rpc-listen-all=true --rpc-allow-origin-all --rpc-secret=mySecret --save-session=aria2.session

# Aria2 continue session (need to keep save-session if you want to be able to restart again and again)
aria2c --enable-rpc --rpc-listen-all=true --rpc-allow-origin-all --rpc-secret=mySecret  --continue --input-file=aria2.session --save-session=aria2.session

# List all installed packages in Arch Linux and format as CSV
pacman -Qqe | sed 's/^\|$/"/g'|paste -sd, -

# If checking variable, check using
if [ -n "${TARGETARCH:-}" ]; then
# instead of
if [ -n "${TARGETARCH}" ]; then
# This ensures it works if TARGETARCH is undefined and we set -u

# Download blob video source with m3u8 link
ffmpeg -i "http://path/to/file.m3u8" -bsf:a aac_adtstoasc -vcodec copy -c copy -crf 50 file.mp4

# Delete a file securely
shred -fuzv -n 38 filename

# Gcloud sane defaults
gcloud compute instances create controller \
    --async \
    --boot-disk-size 200GB \
    --image-family ubuntu-2004-lts \
    --image-project ubuntu-os-cloud \
    --machine-type e2-medium

# gpg export public key
gpg --output mbtamuli-public.pgp --armor --export mbtamuli@gmail.com

# gpg export private key
gpg --armor --export-secret-keys --output mbtamuli.asc mbtamuli@gmail.com

# gpg import private key
gpg --import mbtamuli.asc

# gpg export encrypted private key
# generate a strong random password
gpg --armor --gen-random 1 20
# encrypt key, use password above when asked
gpg --armor --export-secret-keys mbtamuli@gmail.com | gpg --armor --symmetric --output mbtamuli.sec.asc

# gpg import encrypted private key
gpg --decrypt mbtamuli.sec.asc | gpg --import

# A directory contains multiple sub-directory with Go code, and might have an executable in each sub-directory.
# The following find command will delete all the binaries only. Tested on macOS, might need tweaking on Linux
find . -type f -exec sh -c 'for x; do if [[ $(file "$x") == *"executable"* ]]; then rm $x; fi; done' _ {} +


# This will delete all (well, up to 20, or whatever you set in --limit) your workflow runs.
# You can add flags to gh run list to filter runs by workflow or by triggering user.
# Source: https://blog.oddbit.com/post/2022-09-22-delete-workflow-runs/
cd /path/to/github/repository
gh run list --json databaseId  -q '.[].databaseId' |
  xargs -IID gh api \
    "repos/$(gh repo view --json nameWithOwner -q .nameWithOwner)/actions/runs/ID" \
    -X DELETE

# Delete all workflows - well this is a cheat, just set the limit to much higher than the worklow runs you have
cd /path/to/github/repository
gh run list --json databaseId -q '.[].databaseId' --limit 10000 | xargs -IID gh run delete ID
