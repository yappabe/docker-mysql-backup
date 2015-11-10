#!/bin/bash

set | egrep '^(DBS|MYSQL_USERNAME|MYSQL_PASSWORD|RSYNC_COMMAND)=' > /etc/environment

touch /var/log/cron.log

echo "$CRON_TIME root /backup.sh >> /var/log/cron.log 2>&1" > /etc/crontab

exec "${@}"

cron -f -L 0
tail -f /var/log/cron.log
