FROM debian:jessie

MAINTAINER Joeri Verdeyen <joeriv@yappa.be>

RUN apt-get update -q && \
    apt-get install -qy cron mysql-client rsync ssh curl && \
    apt-get clean -q

COPY backup.sh run.sh /

ENV CRON_TIME="0 1,9,17 * * *" DBS="" MYSQL_PASSWORD="root" MYSQL_USERNAME="root" MYSQL_HOST="mysql"
ENV RSYNC_COMMAND="rsync -avz -e \"ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null\" %DIR% user@remote:/"


CMD ["/run.sh"]
