# Infrastrucutre as code
- help speeds up process of configuration management or orchestration 
- Ansible or orchestration - terraform
- Creating a script whether in yml file using ansible 
- YMAL - yet another mark up langauge 

## IAC 
### Anisble VM/controller 
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


__```Additional```__
- Zoe is in office tomorrow 
