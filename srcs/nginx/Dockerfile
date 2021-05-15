FROM alpine:3.12

MAINTAINER djeon <djeon@student.42seoul.kr>

COPY default.conf .
COPY nginx_run.sh .
COPY index.html .

# make nginx socket directory
RUN	mkdir -p /run/nginx

# install openssl, nginx
RUN apk update && apk add openssl nginx --no-cache --quiet && \
	mv default.conf /etc/nginx/conf.d && \
	mv index.html /var/www/localhost/htdocs

# make key
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/O=42Seoul/OU=Gun/CN=localhost" -keyout etc/ssl/private/localhost.dev.key -out etc/ssl/certs/localhost.dev.crt

RUN	chmod 600 etc/ssl/certs/localhost.dev.crt etc/ssl/private/localhost.dev.key

EXPOSE 80 443

ENTRYPOINT sh nginx_run.sh
