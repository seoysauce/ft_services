FROM alpine:3.12

MAINTAINER djeon <djeon@student.42seoul.kr>

COPY mariadb-server.cnf /tmp/
COPY mysql_init.sql /tmp/
COPY mysql_run.sh .

RUN chmod 777 -R /tmp/*

# install mysql, openrc
RUN apk update && apk add openrc mysql mysql-client --no-cache --quiet

EXPOSE 3306

ENTRYPOINT sh mysql_run.sh
