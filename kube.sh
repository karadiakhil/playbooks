#!/bin/bash
echo "This script Deploys Kube-cluster on node"
dir=/root/playbooks/
if [ -d "$dir" ]
then
cd $dir;ansible-playbook kube-setup.yaml
else
echo "No Folder Found"
fi
