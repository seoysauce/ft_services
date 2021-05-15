FROM alpine:3.12

MAINTAINER djeon <djeon@student.42seoul.kr>

COPY default.conf .
COPY phpmyadmin_run.sh .
COPY supervisor.conf /etc/supervisord.conf

# make nginx socket directory
RUN mkdir -p /run/nginx

# make root directory
RUN mkdir -p /www

# pull phpmyadmin
#ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz

# tar phpmyadmin
#RUN tar -xf phpMyAdmin-5.0.2-all-languages.tar.gz && \
#	mv phpMyAdmin-5.0.2-all-languages/* /www/ && \
#	rm phpMyAdmin-5.0.2-all-languages.tar.gz

# install openrc, wget, php7
RUN apk update && apk add --no-cache --quiet openrc wget php7 php7-fpm php7-opcache \
	php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

# install nginx
RUN apk add nginx --no-cache --quiet && \
	mv default.conf /etc/nginx/conf.d

# install supervisor
RUN apk add supervisor --no-cache --quiet

EXPOSE 5000

ENTRYPOINT sh phpmyadmin_run.sh
