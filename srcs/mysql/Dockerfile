FROM alpine:3.12

MAINTAINER djeon <djeon@student.42seoul.kr>

COPY mariadb-server.cnf /tmp/
COPY mysql_init /tmp/
COPY mysql_run.sh .
COPY telegraf.conf .
COPY wordpress_db.sql .
COPY supervisord.conf .

RUN chmod 777 -R /tmp/*

RUN mkdir -p /etc/telegraf

# add packages
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

# install mysql, openrc, telegraf, supervisor
RUN apk update && apk add supervisor openrc telegraf mysql mysql-client --no-cache --quiet && \
	mv telegraf.conf /etc/telegraf && \
	mv supervisord.conf /etc

EXPOSE 3306

ENTRYPOINT sh mysql_run.sh
