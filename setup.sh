#!/bin/zsh

#========================= Update softwares ====================================#
#update minikube
echo "Updating minikube & kubectl..."
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 &> /dev/null && chmod +x minikube
echo "user42\nuser42" | sudo -S mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
rm ./minikube

#update kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl &> /dev/null
chmod +x ./kubectl
echo "user42\nuser42" | sudo -S mv ./kubectl /usr/local/bin/kubectl

#in case docker is not already running (minikube permission denied: /var/run/docker.sock)
echo "user42\nuser42" | sudo -S chmod 666 /var/run/docker.sock

#========================== Start Minikube =====================================#

#require 2 cpus here, if not, restart VB with 2 processors, or add --cpus=1
minikube delete
minikube start --driver=docker
minikube addons enable metallb
minikube addons enable metrics-server
kubectl apply -f srcs/metallb-configmap.yaml
eval $(minikube docker-env) 

#========================  Build Docker images ==================================#

services=(influxdb mysql nginx phpmyadmin wordpress ftps grafana)

for service in $services
do
	echo "Building image: $service..."
	docker build srcs/$service -t $service-local-image &> /dev/null
done

#======================= Build Kubernetes cluster ===============================#

kubectl apply -f srcs/influxdb/telegraf-config.yaml &> /dev/null
for service in $services
do
	kubectl apply -f srcs/$service/$service.yaml &> /dev/null
done

#========================= Print cluster info ===================================#

echo "=========================================================="
echo "Welcome!"
echo "Entry point to ft_services: 192.168.49.5"
echo "-----------------------------------------------------"
echo "|   services       |     user       |    password   |"
echo "-----------------------------------------------------"
echo "| mysql/phpmyadmin | wpdb_admin     | wpdb_pw       |"
echo "| wordpress(admin) | tyuan          | tyuan         |"
echo "| wordpress(users) | user001(2/3)   | user001(2/3)  |"
echo "| grafana          | admin          | admin         |"
echo "| influxdb         | influxdb_admin | influxdb_pw   |"
echo "| ftps             | ftp_admin      | ftp_pw        |"
echo "| ssh in nginx     | ssh_admin      | ssh_pw        |"
echo "-----------------------------------------------------"
echo "========================================================= "

minikube dashboard &

