#!/bin/bash

set -e

. /etc/environment
DIR=$(mktemp -d)
TS=$(date +%d_%m_%Y_%H_%M)

if [ -z "$DBS" ]
then
	mysqldump -u$MYSQL_USERNAME -p$MYSQL_PASSWORD -h$MYSQL_HOST --all-databases | gzip > $DIR/all-databases-$TS.sql.gz
else
	for DB in $DBS
	do
		mysqldump -u$MYSQL_USERNAME -p$MYSQL_PASSWORD -h$MYSQL_HOST $DB | gzip > $DIR/$DB-$TS.sql.gz
	done
fi

COMMAND=${RSYNC_COMMAND//%DIR%/$DIR}

eval $( echo $COMMAND )

# Clean up
rm -rf $DIR
