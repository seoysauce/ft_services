FROM alpine:3.12

COPY wp-config.php . 
COPY wordpress_run.sh .

RUN apk update && apk add wget
RUN mkdir -p /www

EXPOSE 5050

ENTRYPOINT sh wordpress_run.sh
