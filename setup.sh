#rm -rf $HOME/.brew && git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew && export PATH=$HOME/.brew/bin:$PATH && brew update && echo "export PATH=$HOME/.brew/bin:$PATH" >> ~/.zshrc

#brew install minikube
minikube start --driver=virtualbox
minikube status

echo "metalLB setup start"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
cd srcs
MINIKUBE_IP=$(minikube ip)
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" metallb-config_format.yaml > metallb-config.yaml
kubectl apply -f metallb-config.yaml
#kubectl apply -f metallb-config.yaml >> $LOG_PATH

echo "nginx setup start"
docker build -t alpine-nginx nginx/
