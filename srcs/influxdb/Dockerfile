FROM alpine:3.12

MAINTAINER djeon <djeon@student.42seoul.kr>

COPY telegraf.conf .

# add packages
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

# install influxdb, telegraf
RUN apk update && apk add influxdb telegraf --no-cache --quiet && \
	mv telegraf.conf /etc/telegraf

RUN mkdir -p /etc/influxdb
RUN mkdir -p /var/lib/influxdb

EXPOSE 8086

ENTRYPOINT ["/usr/sbin/influxd"]
