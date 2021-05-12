FROM alpine:3.12

COPY ./srcs/* /tmp/
RUN chmod 777 -R /tmp/*

#RUN apk update && apk add openrc --no-cache --quiet --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted telegraf

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz \
	&& tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C / \
	&& rm telegraf-1.17.0_linux_amd64.tar.gz

ENTRYPOINT [ "/tmp/telegraf_run.sh" ]
