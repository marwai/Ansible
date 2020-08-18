#!/bin/bash

ssh vagrant@192.168.33.12 << EOF

sudo apt-get install software-properties-common -y
sudo apt-get install tree -y
sudo apt-add-repository ppa:ansible/ansible;
sudo apt-get install ansible -y



cd /etc/ansible
sudo nano hosts
sudo echo "[web]
       192.168.33.10 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
       [db]
       192.168.33.11 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant
       [aws]
       192.168.33.12 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant" >> hosts

cd ..

#go into web server
ssh vagrant@192.168.33.11
sudo apt-get update -y
sudo apt-get upgrade -y
exit

#go into dev server
ssh vagrant@192.168.33.12
sudo apt-get update -y
sudo apt-get upgrade -y
exit

ansible all -m ping
EOF
