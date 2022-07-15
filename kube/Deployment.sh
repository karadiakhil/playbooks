#!/bin/bash

#app=`kubectl get pods |grep -i myapp |wc -l`
#svc=`kubectl get svc |grep -i app |wc -l`
clusterip=`kubectl get svc |grep -i myapp |awk '{print $3}'`
port=`kubectl get services |grep -i myapp |awk '{print $5}' |tr ':' ' '|awk '{print $2}' | tr '/' ' ' |awk '{print $1}'`

server=`cat /etc/hosts |grep -i worker| awk '{print $1}'`

#if [[ $app -ge 1 ]] && [[ $svc -ge 1 ]] 
#then

#echo -e "--------------------------------"

#echo -e "Deleting Previous NGINX  Deployment" 

#echo -e "--------------------------------"


#kubectl delete -f /root/kube/Replica-set.yaml
#kubectl delete -f /root/kube/service-def.yaml

#sleep 5



#if [ $? -ne 0 ]

#then

echo -e "--------------------------------------------" 

echo -e "Deploying the Nginx Replicaset on Kubernetes"

echo -e "--------------------------------------------" 



kubectl apply -f  /root/kube/Replica-set.yaml >> /dev/null 2>&1

sleep 10

echo -e "--------------------------------------------" 

echo -e "Define Service for the Replicaset"

echo -e "--------------------------------------------" 
kubectl apply -f  /root/kube/service-def.yaml >>  /dev/null 2>&1

sleep 15


echo -e "--------------------------------------------------------------------------------------------"

kubectl get pods -o wide

echo -e "--------------------------------------------------------------------------------------------"


echo -e "--------------------------------------------------------------------------------------------"

kubectl get svc

echo -e "--------------------------------------------------------------------------------------------"


echo -e "-----------------------------------------------------------------------" 

echo -e "To Access the nginx Containers runnning on pods deployed on Worker noes"

echo -e "-----------------------------------------------------------------------" 

for i in $server 

do

echo -e "----------------" 

echo -e "https://$i:$port"

echo -e "----------------" 

done

echo -e "-------------------------------------------------------------------------------------"

echo -e "TO ACCESS THE LOAD-BALANCER/CLUSTER-IP FOR THE DEPLOYMENT  'https://$clusterip:$port'"

echo -e "-------------------------------------------------------------------------------------"
#else

#echo "ISSUE WITH KUBE ENV"

#fi 

#fi

 


  
