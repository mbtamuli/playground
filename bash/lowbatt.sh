#!/usr/bin/env bash

# Put this as a cron job to do a check every five minutes and 
# notify if there is less than 15 minutes of charge left.
#
# After making this script executable,
# put this in, after running `crontab -e` ==> */5 * * * * /path/to/this/script


BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 00:15:00 ]] ; then
    DISPLAY=:0.0 /usr/bin/notify-send "low battery" "$BATTINFO"
fi
