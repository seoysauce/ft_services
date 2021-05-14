FROM alpine:3.12

#connect mysql
#COPY wp-config.php . 
COPY wordpress_run.sh .
COPY default.conf .

ADD https://wordpress.org/latest.tar.gz .

RUN mkdir -p /www

RUN tar -xvf latest.tar.gz && \
	mv wordpress /www && \
	rm -f latest.tar.gz
#	mv wp-config.php /www/wordpress && \

RUN apk update && \
	apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN apk add nginx && \
	mv default.conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx

EXPOSE 5050

ENTRYPOINT sh wordpress_run.sh
