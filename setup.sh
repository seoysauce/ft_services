# minikube reset
minikube stop
minikube delete
minikube start --driver=virtualbox
minikube status

# minikube ip env setup
MINIKUBE_IP=$(minikube ip)

# pull minikube docker CLI
eval $(minikube -p minikube docker-env)

echo "metalLB setup start"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" srcs/metallb-config_format.yaml > srcs/metallb-config.yaml
kubectl apply -f srcs/metallb-config.yaml
kubectl apply -f metallb-config.yaml >> $LOG_PATH

echo "build image"
docker build -t alpine-nginx srcs/nginx/
docker build -t alpine-mysql srcs/mysql/
docker build -t alpine-wordpress srcs/wordpress/
docker build -t alpine-phpmyadmin srcs/phpmyadmin/

echo "create object"
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

#echo "telegraf setup start"
#docker build -t service-telegraf ./srcs/telegraf/
#kubectl apply -f ./srcs/telegraf/telegraf.yaml

#echo "influxDB setup start"
#docker build -t service-influxdb ./srcs/influxdb/
#kubectl apply -f ./srcs/influxdb/influxdb.yaml
#kubectl apply -f ./srcs/influxdb/influxdb_conf.yaml

#echo "grafana setup start"
#docker build -t service-grafana ./srcs/grafana/
#kubectl apply -f ./srcs/grafana/grafana.yaml

kubectl get all
