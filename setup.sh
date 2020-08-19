#!/bin/bash

vagrant up

ssh vagrant@192.168.33.12 << EOF

sudo apt-get install software-properties-common -y
sudo apt-get install tree -y
sudo apt-add-repository ppa:ansible/ansible;
sudo apt-get install ansible -y

echo "AWS setup completed"

sudo su
cd /etc/ansible

echo "[web]
192.168.33.10 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant" >> hosts

echo "[db]
192.168.33.11 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant" >> hosts

echo "[aws]
192.168.33.12 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant" >> hosts

cd ..

echo "EXPORTING HOSTS TO ENVIRONMENT COMPLETED"

# go into web server
sshpass -p 'vagrant' ssh vagrant@192.168.33.10
sudo apt-get update -y
sudo apt-get upgrade -y
echo "WEB IS DONE"
exit

# go into db server
sshpass -p 'vagrant' ssh vagrant@192.168.33.11
sudo apt-get update -y
sudo apt-get upgrade -y
echo "DATABASE IS DONE"
exit
EOF

# go into aws server
ssh vagrant@192.168.33.12 << EOF
cd /etc/ansible
ansible-playbook install.yml
exit
EOF
