#FROM alpine:latest
FROM alpine:3.12

MAINTAINER djeon <djeon@student.42seoul.kr>

#RUN apk update && apk add --update openssl nginx
RUN apk update && apk add nginx
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www


#	apk fetch curl\
#	apk fetch openssl\				# install openssl
#	apk fetch vim\					# install vim
#	apk fetch php-fpm\				# install php-fpm
#	apk fetch php-curl\
#	apk fetch wget					# install phpMyAdmin, wordpress

COPY server .
COPY run.sh .
COPY test.sh .
COPY config.inc.php .
COPY wp-config.php .
RUN mkdir -p /run/nginx

RUN mv server /etc/nginx/nginx.conf.orig
EXPOSE 22 80 443

ENTRYPOINT sh test.sh

