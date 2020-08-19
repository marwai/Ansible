vpc Basics
- create computing resources* create another instance or store files
- to protect data

Required 2 tier network for xyz - aws vpc*

instances exist within subnet
propagation of records within Nacl lists that propagate to all the servers. In AWS is instantaneous

VPC on Webapp

Private is where we have database

store computers and run data


# Infrastructure as code
- help speeds up process of configuration management or orchestration
- Ansible or orchestration - terraform
- Creating a script whether in yml file using ansible
- YMAL - yet another mark up langauge

## IAC
### Ansible VM/controller
- 100+ servers running. Some specific task to run on specifics dates, times and areas. yml create one fil in controller, for example, install provision dependencies without the
the use of provision folders

# Ansible - automation tool for configuration management
- Why use ansible:
	- simple
	- Connect using ```SSH``` - allows to connect to any server using SSH
	- Agentless - installing software requires software in vm - ```does not need ansible installed in either server, just needs it in the controller ```
	- IT automation tool - to install dependencies
- 3 controllers:
	- Ansible,
	- DB - python is built in because Linux has it readily installed
	- VM webapp - Python is built in
- Instructions:

```
apt-get update
apt-get upgrade

```

# What is YAML?
Human-readable data serialisation language
Simple syntax, stands for Yet Another Markup Language

# What is Configuration Management?
Chef, Puppet
They help configure the software and systems on this infrastructure that has already been provisioned.
It maintains configuration of the product performance by keeping a record and updating detailed information which describes an enterprise's hardware and software.

# More reliable deployments
Ansible is agentless meaning no additional software or firewall ports are required and you do not have to separately set up a management infrastructure which includes managing your entire systems, network and storage.
Ansible further reduces the effort required for your team to start automating right away.
Ansible isn't just about automation. IaC requires DevOps practices to automation scrips to ensure they're free of errors, are able to be redeployed on multiple servers and can be rolled back in case of problems, and can be engaged by both operations and development teams.

# Best practices of IaC:
1.Managing infrastructure via source control, providing a detailed audit trail for changes.
2.Applying testing to infrastructure in the form of unit testing, functional testing, and integration testing.
3.Avoid written documentation, since the code itself will document the state of the machine. This is particularly powerful because it means, for the first time, that infrastructure documentation is always up to date.
4.Enables collaboration around infrastructure configuration and provisioning, most notably between dev and ops.


# Ansible Ad-Hoc Commands

An Ansible ad-hoc command uses the /usr/bin/ansible command-line tool to automate a single task on one or more managed nodes.
Ad-hoc commands are quick and easy, but they are not reusable.


## Benefits of Ansible
How this fit in DevOps:
- Saves time - cost effective
- Open source - not extra resources needed to start
- Makes configuration management predictable
- __Automation__ - automates the process of configuration management
- ```hybrid cloud``` - there are 3vms in our own laptop - hybrid in aws -
- Doesn't differentiate between provider if correct dependencies are installed.


# Benefits
- Ad-hoc tasks can be used to reboot servers, copy files, manage packages and users, and much
more.
- You can use any Ansible module in an ad-hoc task. Ad-hoc tasks, like playbooks, use a
declarative model, calculating and executing the actions required to reach a specified final state.
- They achieve a form of idempotence by checking the current state before they begin and doing nothing
 unless the current state is different from the specified final state.

___
# Linux commands in Ansible
```
# Commands in AWS controller
$ ansible web -a "date"
$ ansible db -a "uname -a"
$ ansible all -m shell -a "ls -a"
$ ansible all -m shell -a "free"

# The power of ansible is finding information across multiple in servers in matter of seconds, for example,
imagine having 50 servers where you need to know the time for each, instead you can run ansible
```

___

### Small exercise
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
# Exercise 

Why ansible? Ansible can be used to provision multiple servers, and access them all from one central place, the controller. This saves a lot of time. For example, rather than updating dependencies or even install new packages individually using provision folders, we can simply do this in one central place, the controller. Not only does this same time when configurating packages but the reusability of ansible is a great advantage. Through the use of ansible packages we can install any package. This is because ansible knows al the package managers. Now this differs from Bash, Bash runs on all Linux however not all package managers.
So using ansible we can install anything across all operating systems.

[setup.md exercise](/The_setup.md)


____

__```Additional```__
- Zoe is in office tomorrow
- DevOps Concepts
- Cloud Concepts
- VPC
- TDD why tdd, link to: agile, testing, devops
