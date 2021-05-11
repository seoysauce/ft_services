#!/bin/sh

#mv /tmp/mariadb /etc/init.d/
chmod 444 /tmp/mariadb-server.cnf # nginx
mv /tmp/mariadb-server.cnf /etc/my.cnf.d/ # wordpress 연동

rc-status && touch /run/openrc/softlevel && rc-service mariadb setup # rc-status 이게 없으면 실행이 안됨 touch 이게 없으면 rc-service가 실행이 안됨

#if [[ ! -d /run/mysqld ]]; then
#	mkdir /run/mysqld
#fi
mkdir /run/mysqld

mysqld --user=root --bootstrap < /tmp/mysql_init.sql
mysqld --user=root --console
