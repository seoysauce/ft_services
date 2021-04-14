FROM alpine:latest

MAINTAINER djeon <djeon@student.42seoul.kr>

RUN apk update && apk add --update openssl nginx
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/O=42Seoul/OU=Gun/CN=localhost" -keyout etc/ssl/private/localhost.dev.key -out etc/ssl/certs/localhost.dev.crt

EXPOSE 80 443
