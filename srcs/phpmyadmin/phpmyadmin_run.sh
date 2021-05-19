PHPMYADMIN_DATA="$(wget https://www.phpmyadmin.net/home_page/version.txt -q -O-)"
PHPMYADMIN_URL="$(echo $PHPMYADMIN_DATA | cut -d ' ' -f 3)"
PHPMYADMIN_VER="$(echo $PHPMYADMIN_DATA | cut -d ' ' -f 1)"

wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
tar -xf phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages/* /www/
rm phpMyAdmin-5.0.2-all-languages.tar.gz

#chmod 777 -R /www/

supervisord -c /etc/supervisord.conf

#nginx -g "daemon off;"

#php -S 0.0.0.0:5000 -t /www/
