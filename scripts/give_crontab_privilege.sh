#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "no user argument given, exiting"
    exit 2
fi

if [ $(is_running_as_root.sh) -eq 0 ]; then
    echo "not running as root, exiting"
    exit 2
fi

cronallow_path="/etc/cron.allow"
if ! [ -f $cronallow_path ]; then
    echo "no file named '$cronallow_path', creating"
    touch /etc/cron.allow
elif [ $( grep -c $1 $cronallow_path ) -ne 0 ]; then
    echo "$1 has cron access already, exiting"
    exit 2
fi

echo $1 >> "/etc/cron.allow"

cronfile_path="/var/spool/cron/$1"
if ! [ -f $cronfile_path ]; then
    echo "no file named '$cronfile_path', creating"
    touch $cronfile_path
fi

crontab $cronfile_path
