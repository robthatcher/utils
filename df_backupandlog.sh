#!/bin/bash

# Simple demo file which reads in a file containing a list of file(s) paths, then creates a backup of each named file
# in the list with a timestamp, then logs the fact that the data file was updated.

# Author Rob.Thatcher 2013 http://robthatcher.net/

#Vars

FILE=df_backupandlog.conf
TIMESTAMP=`date +%s`

#Main

cat $FILE | while read line
do
        tar -c -a -f $line.$TIMESTAMP.tgz $line
        echo "Backed up file $line (`date +%s`)" >> $line.log
done

