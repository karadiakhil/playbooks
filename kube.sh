


#/bin/bash

dir="/root/playbooks"
if [[ -d "$dir" ]]
then
cd $dir;ansible-playbook kube-setup.yaml
fi
