#!/usr/bin/env bash
#************************************************#
#                setup_monit.sh                  #
#           written by Mriyam Tamuli             #
#                 Dec 14, 2016                   #
#                                                #
#    Script to install Monit 5.20.0 in Ubuntu.   #
#        Tested on Ubuntu 14.04, 16.04.          #
#************************************************#
# Shamelessly copied from https://easyengine.io/tutorials/monitoring/monit/ and modified.

if [[ "$EUID" -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi
LOGFILE="/tmp/setup_monit.log"
ERRORFILE="/tmp/setup_monit.err"

printf "[\e[0;34mNOTICE\e[0m] This script will install 5.20.0 version of Monit\n"
printf "[\e[0;34mNOTICE\e[0m] Check for updated versions at https://mmonit.com/monit/dist/binary/\n"
printf "[\e[4;31mACTION\e[0m] Enter version (Enter for default): "
read version
version=${version:-5.20.0}
version_dl_status=false
{
    {
        # TODO: REMOVE THIS COMMENT
        # apt-get update && apt-get install curl -y


        curl -s -f -O -O https://mmonit.com/monit/dist/binary/"$version"/monit-"$version"-linux-x64.tar.gz{,.sha256}
        version_dl_status="$?"
        if [[ "$version_dl_status" -eq 0 ]]; then :; else echo "Version not found" && exit 1; fi

        sum=monit-"$version"-linux-x64.tar.gz.sha256
        check="$(sha256sum --status -c "$sum")"
        if sha256sum --status -c "$sum"; then
          # Checksum matches

          tar xf monit-"$version"-linux-x64.tar.gz

          pushd monit-"$version" > /dev/null

          # Install monit binary
          cp bin/monit /usr/local/bin/monit

          # Install monit man pages
          cp -R man/man1 /usr/local/share/man/
          mandb

          # Install default control file
          cp conf/monitrc /etc/monitrc
          mkdir -p /etc/monit
          cp conf/monitrc /etc/monit/monitrc

          popd > /dev/null

          # Install defaults for monit initscript
          curl https://gist.githubusercontent.com/mbtamuli/d7724000980510121b3b5cf3d4a48108/raw/08801fb50ee2f9f4382ad3c2ee2f24d9e49f9d6b/monit_default -o /etc/default/monit
          chmod 0644 /etc/default/monit

          version="$(lsb_release -sc)"
          if [[ "$version" == "xenial" ]]; then
            # Install systemd template for monit
            curl https://gist.githubusercontent.com/mbtamuli/d7724000980510121b3b5cf3d4a48108/raw/9c5fcbe9078dca98ce9553f8159750803dfc3d40/monit.service -o /lib/systemd/system/monit.service
            systemctl start monit.service
          elif [[ "$version" == "trusty" ]]; then
            # Install upstart script for monit
            curl https://gist.githubusercontent.com/mbtamuli/d7724000980510121b3b5cf3d4a48108/raw/9c5fcbe9078dca98ce9553f8159750803dfc3d40/monit.conf -o /etc/init/monit.conf
            initctl reload-configuration
            start monit
          fi

        else
          printf >&2 "Checksum does not match. Aborting\n" && exit 1
        fi
    } > >(tee "$LOGFILE" );
} 2> >(tee "$ERRORFILE" )
echo -e "[\e[4;31mACTION\e[0m] Start monit using \`service monit start\`"
echo -e "[\e[0;34mNOTICE\e[0m] Check $LOGFILE and $ERRORFILE"
