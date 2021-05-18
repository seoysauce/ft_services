FROM alpine:3.12

MAINTAINER djeon <djeon@student.42seoul.kr>

COPY telegraf.conf .
COPY supervisord.conf .
COPY influxdb_run.sh .

RUN cp telegraf.conf /etc
RUN mkdir -p /etc/telegraf

# add packages
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

# install influxdb, telegraf, supervisor
RUN apk update && apk add influxdb telegraf supervisor --no-cache --quiet && \
	mv telegraf.conf /etc/telegraf && \
	mv supervisord.conf /etc/supervisord.conf

RUN mkdir -p /etc/influxdb
RUN mkdir -p /var/lib/influxdb

EXPOSE 8086

ENTRYPOINT sh influxdb_run.sh
