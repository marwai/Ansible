# Instructions
## Manual set-up
1) First run the following up to run all the machines

```
vagrant up
```

2) Enter each VM update the packages:

```
vagrant ssh db
sudo apt-get update
exit

# repeat steps but with app and aws
vagrant ssh app
vagrant ssh aws
```

3) Enter the AWS and run this


```
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get install ansible -y # install ansible
sudo apt-get install tree
```

4) Enter /etc/ansible folder

```
cd /etc/ansible tree
### ansible.cfg, hosts and roles should appear
```

5) test no connected to app and

```
ping 192.168.33.11
ping 192.168.33.10 # testing connection with Db and app
```

6) Create Host entries

```
cd ../../etc/ansible
sudo nano hosts

# copy the following inside hosts
[web]
192.168.33.10 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant

[db]
192.168.33.11 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant


```

7) vagrant ssh into the other vm

```
ssh vagrant@192.168.33.10
ssh vagrant@192.168.33.11

# you will be asked to add a new ECDSA fingerprint. Password is vagrant
# After adding these new fingerprints, sudo apt-get update
sudo apt-get update

```

8) ping the connections back in aws controller
```
ansible all -m ping
# Connection should all be green
```

9) run the playbook
```
ansible-playbook mongodb_setup.yml
ansible-playbook nginx_setup.yml
```

10) Go into the browser and copy the web ip address
```
192.168.33.10
# test the following to see everything is working
192.168.33.10/fibonacci/20
192.168.33.10/posts
```

# Errors 
if mongodb_setup.yml doesn't run try going into the db vm
```
ssh vagrant@db
sudo systemctl enable mongodb
sudo systemctl restart mongodb
sudo systemctl status mongodb
```

Go back to aws vm

```
# exit back into aws vm follow steps 9) again
exit  
```
