FROM alpine:3.12

COPY ./srcs/* /tmp/
COPY ./srcs/dashboards/ /tmp/dashboards/
RUN chmod 777 -R /tmp/*

RUN apk update && apk add openrc
#RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ grafana

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.6.linux-amd64.tar.gz \
	&& tar -xf grafana-enterprise-7.3.6.linux-amd64.tar.gz --strip-components=1 -C / \
	&& rm grafana-enterprise-7.3.6.linux-amd64.tar.gz 

RUN mv /tmp/dashboards/* /usr/share/grafana/public/dashboards/
RUN mv /tmp/influxdb_info.yaml /usr/share/grafana/conf/provisioning/datasources/
RUN mv /tmp/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/

EXPOSE 3000

ENTRYPOINT ["/tmp/grafana_run.sh"]
