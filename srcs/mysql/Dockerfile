FROM alpine:3.12

MAINTAINER djeon <djeon@student.42seoul.kr>

COPY mariadb-server.cnf /tmp/
COPY mysql_init.sql /tmp/
COPY mysql_run.sh .
COPY telegraf.conf .

RUN chmod 777 -R /tmp/*

# add packages
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

# install mysql, openrc, telegraf
RUN apk update && apk add openrc telegraf mysql mysql-client --no-cache --quiet && \
	mv telegraf.conf /etc/telegraf

EXPOSE 3306

ENTRYPOINT sh mysql_run.sh
