#!/bin/bash

# Simple Housekeeping - For a given list of files older than n days remove, read file locations from config.

# Author Rob.Thatcher 2013 http://robthatcher.net/

#Vars

VERSION=0.3
TIMESTAMP=`date +%s`       #epoch style timestamp
FILE=hsekeeper.conf        #name and path of config file
RETENTION=4                #files which have not been modified in this many days or more caught by housekeeper


#Error handle no config file

if [[ ! -f $FILE ]];
        then
                echo -e "\nError, config File $FILE does not exist.\n"
                exit 1
fi

#Main

case $1 in
        -h|--help)
                echo -e "\nPossible flags which may be passed are :\n\n\t-v or --version for version\n\t-h or --help this help\n\t-r or --report for terminal output\n"
                echo -e "\nThis script is configured to housekeep files older than $RETENTION days.\n"
                exit 0;;
        -v|--version)
                echo -e "\nHousekeeping Script Version $VERSION\n"
                exit 0 ;;
        -r|--report)
                while read line;
                        do
                                find $line -type f -mtime +$RETENTION
                        done < $FILE
                exit 0 ;;
        -m|--mail)
                echo -e "\nemail the list of files - TBD\n"
                exit 0 ;;
        *)
                echo -e "\nFell through, no parameters.\n"
                echo -e "\nPossible flags which may be passed are :\n\n\t-v or --version for version\n\t-h or --help this help\n\t-r or --report for terminal output\n"

esac
