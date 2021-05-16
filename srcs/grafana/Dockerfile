FROM alpine:3.12

COPY dashboards.yaml .
COPY influxdb_info.yaml .
COPY telegraf.conf .
COPY grafana_run.sh .
COPY dashboard_all.json .

# add packages
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

# install openrc, telegraf
RUN apk update && apk add openrc telegraf --no-cache --quiet && \
	mv telegraf.conf /etc/telegraf
RUN apk add --no-cache --quiet --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ grafana

# install grafana
#RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.6.linux-amd64.tar.gz && \
#	tar -xf grafana-enterprise-7.3.6.linux-amd64.tar.gz --strip-components=1 -C / && \
#	rm grafana-enterprise-7.3.6.linux-amd64.tar.gz 

RUN mv dashboard_all.json /usr/share/grafana/public/dashboards/
RUN mv influxdb_info.yaml /usr/share/grafana/conf/provisioning/datasources
RUN mv dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards

EXPOSE 3000

ENTRYPOINT sh grafana_run.sh
