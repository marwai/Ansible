vpc Basics
- create computing resources* create another instance or store files
- to protect data 

Required 2 tier network for xyz - aws vpc* 

instances exist within subnet
propagation of records within Nacl lists that propagate to all the servers. In AWS is instanenous 

VPC on Webapp 

Private is where we have database 

store computers and run data 


# Infrastrucutre as code
- help speeds up process of configuration management or orchestration 
- Ansible or orchestration - terraform
- Creating a script whether in yml file using ansible 
- YMAL - yet another mark up langauge 

## IAC 
### Ansible VM/controller 
- 100+ servers running. Some specific taskt to run on specifics dates, times and areas. yml create one fil in controller, for example, install provision depencies without the
the use of provision folders 
### Ansible - automation tool for configuration management 
- Why use ansible:
	- simple 
	- Connect using ```SSH``` - allows to connect to any server using SSH
	- Agentless - installing software requires software in vm - ```does not need ansible installed in either server, just needs it in the controller ```
	- IT automation tool - to install depencies 
- 3 controllers: 
	- Ansible, 
	- DB - python is built in because Linux has it readily installed 
	- VM webapp - Python is built in 
- Instructions: 

```
apt-get update
apt-get upgrade 

``` 

Create three vms using vagrant, ssh into them, change some configuration 

## Benefits 
How this fit in DevOps:
- Saves time - cost effective 
- Open source - not extra resources needed to start 
- Makes configuration management predictable
- __Automation__ - automates the process of configuration management 
- ```hybird cloud``` - there are 3vms in our own laptop - hybrid in aws - 
- Doesn't differetiate between provider if correct dependencies are installed. 

Difference between ansible and ansible tower has UI 


# Instructions 

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

9) 

```

```
______

## Ansible Ad-hoc commands
- Why should we use them/benefits
- When should we use/benefits 




### Web 192.168.33.10
### Location: USA

### DB 192.168.33.11
### Location: Dubai

### Location in Germany 

```
With adhoc it is easy, fast, robust, flexible
find location, time, space


# Benefits
- Ad-hoc tasks can be used to reboot servers, copy files, manage packages and users, and much 
more. 
- You can use any Ansible module in an ad-hoc task. Ad-hoc tasks, like playbooks, use a 
declarative model, calculating and executing the actions required to reach a specified final state. 
- They achieve a form of idempotence by checking the current state before they begin and doing nothing
 unless the current state is different from the specified final state.
```

____

# Linux commands in Ansible

```
# Commands in AWS controler
$ ansible web -a "date" 
$ ansible db -a "uname -a"
$ ansible all -m shell -a "ls -a"
$ ansible all -m shell -a "free"

# The power of ansible is finding information across multiple in servers in matter of seconds, for example,
imagine having 50 serverse where you need to know the time for each, instead you can run ansible 
```

___

## Small exercise 
Go the [link](https://docs.ansible.com/ansible/latest/user_guide/intro_adhoc.html#why-use-ad-hoc-commands)
- Ansible all -m setup
- ansible all -a "df -h" # free disk space
- ansible all -a "uptime" # uptime 
- ansible all -m shell -a 'mpstat -P ALL' # displays the statistics of the CPU usage of the system
- ansible all -m shell -a 'free -m'
- all -m copy -a "src=/etc/ansible/test.sh dest=/home/vagrant" # copy files
- ansible all -m shell -a "ls -a" # see what's inside files

### Individual servers 
- ansible web -a "uptime 
- ansibl db -m shell -a "mpstat -P all"

### Trello exercise 
- ansible all -m shell -a "ifconfig" # find ip address
- ansible all -m shell -a "env" # find environment variables
- ansible all -a "uptime" # uptime
- ansible all -a "df -h" # disk space 
- ansible all -a "mpstat -P all" # all processes 

IAAS speeds up process


____

# Playbook
- Ansible Playbooks
- What are they?
- Why should we use them/benefits?
- How to create a playbook?
- What can we do with playbooks?

__```Playbooks```__ are written in YAML .yml or .yaml 
YAML syntax -YAML file starts with ---three dashes(---)


____
## Exercise 

Why ansible? 
Ansible can be used to provision multiple servers, and access them all from one central place, the controller. This saves a lot
of time. For example, rather than  than updating dependencies or even install new packages individually using provision folders, we
can simply do this in one central place, the controller. Not only does this same time when configurating packages but the
reusability of ansible is a great advantage. Through the use of ansible packaes we can install any package. This is because
ansible knows al the package managers. Now this differs from Bash, Bash runs on all linux however not all package managers. 
So using ansible we can install anything across all operating systems. 

```
# This is a YAML file to install nginx onto oue web VM using YAML
---

# where do we want to install
- hosts: web

# get the facts
  gather_facts: yes

# changes access to root user
  become: true

# what do we want ansible to do for us in the playbook
# In this case our only task is to install nginx


# Install nginx
  tasks:
  - name: Install nginx
    apt: pkg=nginx state=present


# Setting up reverse proxy
  - name: nginx reverse proxy
    shell:  |
      sudo unlink /etc/nginx/sites-enabled/default
      cd /etc/nginx/sites-available
      sudo touch reverse-proxy.conf
      sudo chmod 666 reverse-proxy.conf
      echo "server{
        listen 80;
        server_name development.local;
        location / {
            proxy_pass http://127.0.0.1:3000/;
        }
      }" >> reverse-proxy.conf
      sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
      sudo service nginx restart
      nginx -t

# Installing NodeJs
  - name: Install Nodejs
    apt: pkg=nodejs state=present



# Downloading pm2
  - name: Install pm2
    npm:
      name: pm2
      global: yes


  - name:
    shell: |
      cd app
      sudo npm install -g npm
      npm install
      pm2 stop all
      pm2 start app.js -f
```





____

__```Additional```__
- Zoe is in office tomorrow 
- DevOps Concepts
- Cloud Concepts 
- VPC
- TDD why tdd, link to: agile, testing, devops 


