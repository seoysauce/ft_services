rc default
/usr/bin/telegraf &
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u root mysql < /tmp/mysql_init
mysql -u root my_db < wordpress_db.sql
rc-service mariadb stop
/usr/bin/mysqld_safe
supervisord -c /etc/supervisord.conf
