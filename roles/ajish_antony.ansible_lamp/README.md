
# Ansible Role Provisioning LAMP Stack For Multiple OS
### (Implemented via Ansible Galaxy for Amazon Linux 2, Ubuntu 20.04, CentOS 8 )

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

There were several scenarios where needs for LAMP Stack to be installed on different OS and we have to proceed with each time manually. Commonly these requirements come in Operating Systems as such Amazon Linux, CentOS, Ubuntu. To automate the installation process of these, here I have made use of Ansible and the automation process implemented via the Ansible role.

The Ansible role is an independent component that allows the reuse of common configuration steps. Also, Roles are defined using YAML files with a predefined directory structure. A role directory structure contains directories: defaults, vars, tasks, files, templates, meta, handlers.

The LAMP stack - that needs to create a server environment for dynamic websites, to install some software when we are choosing PHP as a programming language. Here Operating system, Linux, is the base layer. Then Apache, the web daemon that sits on top of the OS. Then the database stores all the information served by the web daemon, and PHP (or any P* scripting language) is used to drive and display all the data, and allow for user interaction.


## Here Supported Operating Systems

- Amazon Linux 2
- Ubuntu 20.04
- CentOS 8

## LAMP Structure

- Operating System
- Web Server
- Database Layer
- Scripting Layer

## Modules Used

- yum
- file
- template
- copy
- shell
- mysql_user
- rpm_key
- dnf
- firewalld
- apt

## Ansible Role Directory Structure

```sh
ansible-lamp/
├── defaults
│└── main.yml
├── files
│├── test.html
│└── test.php
├── handlers
│└── main.yml
├── inventory.txt
├── lamp.yml
├── meta
│└── main.yml
├── README.md
├── tasks
│├── amazon.yml
│├── centos.yml
│├── main.yml
│└── ubuntu.yml
├── templates
│├── httpd.conf.tmpl
│├── vhost.conf.tmpl
│└── virtualhost.conf.tmpl
├── tests
│├── inventory
│└── test.yml
├── vars
│└── main.yml
└── key.pem
```
## Architecture Diagram

![
alt_txt
](https://i.ibb.co/kyRkkB6/lamp-3.jpg)

## Pre Requisites

- Ansible should be installed
- For Ansible Installation, refer - [Installation Steps](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) 
 
## User Instructions

- Install the role from Ansible Galaxy

```sh
ansible-galaxy install ajish_antony.ansible_lamp
```

- Add the host in the inventory file and also key for accessing the servers under the working directory. 

- For testing the connectivity between the servers, have a check with the below command

```sh
ansible -i inventory.txt all -m ping 
```

- Variables have been declared for the Apache and the Database in the vars/main.yml file. According to the requirements update the same. Also update the current working directory in the file lamp.yml

```sh
- hosts: all
  become: true
  roles:
    - Mention-Your-Current-Working-Directory
```

- For testing any syntax error, have a check as mentioned below

```sh
ansible-playbook -i inventory.txt lamp.yml --syntax-check
```

- If everything is fine, further move forwards with the execution

```sh
ansible-playbook -i inventory.txt lamp.yml
```


## Conclusion

It's a small project for lamp provisioning via Ansible, which makes the process easier to handle on multiple servers.


### ⚙️ Connect with Me

<p align="center">
<a href="mailto:ajishantony95@gmail.com"><img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white"/></a>
<a href="https://www.linkedin.com/in/ajish-antony/"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"/></a>
