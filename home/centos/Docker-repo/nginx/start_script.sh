#!/bin/bash
#rm -rf ./conf/load-balancer.conf #delete old files
#cp load-balancer.conf.bkp ./conf/load-balancer.conf #load files from backup
kubectl delete -f conf-map.yaml
kubectl delete -f nginx.yaml

match='least_conn;'
file='./conf/load-balancer.conf'

ip=$(kubectl describe service tomcat | grep "Endpoints:") #find server ip

IFS_=${IFS} #save IFS value
IFS=,
tmp=${ip#*1} #delete unused information
tmp=$(echo "1$tmp")

for ip1 in $tmp #loop to get all ip address
do
sed -i "s/$match/$match\n        server ${ip1};/" $file
echo "tomcat server ip address: $ip1"
done

IFS=${IFS_}

	#create ConfigMap from files in directory ./conf
kubectl create configmap nginx-map --from-file=./conf
kubectl get configmaps nginx-map -o yaml > conf-map.yaml

	#start nginx
kubectl create -f nginx.yaml 
