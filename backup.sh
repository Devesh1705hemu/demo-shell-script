#!/bin/bash

<<info
This shell script wil take periodic backups

eg 
./backup.sh <source> <dest>
src /home/ubuntu/scripts
dest /home/ubuntu/backups
info

src=$1
dest=$2

timestamp=$(date '+%Y-%m-%d-%H-%M-%S') 

zip "$dest/backup-$timestamp.zip" $src > /dev/null
 
aws s3 sync "$dest" s3://aws-update-1
echo "backup Completed and uploaded to s3"
#echo "$dest/backup-$timestamp.zip"

