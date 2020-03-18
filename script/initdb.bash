#!/bin/bash

if [ -z "$NAMS_MYSQL_USER" ] || [ -z "$NAMS_MYSQL_PASSWORD" ] 
then
  echo "You must set NAMS_MYSQL_USER and NAMS_MYSQL_PASSWORD environment variables"
  exit 1
fi

mysql --user="$NAMS_MYSQL_USER" --password="$NAMS_MYSQL_PASSWORD" -v < ./initdb.sql