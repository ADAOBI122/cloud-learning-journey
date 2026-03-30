ANSIBLE – DETAILED NOTES

1. What is Ansible?

Ansible is an agentless automation tool used for:

Configuration management
Application deployment
Server provisioning

 “Agentless” means:

You don’t install anything on remote servers
It connects mainly via SSH

 2. How Ansible Works (Core Idea)

You have:

Control Node → your local vagrant machine (where Ansible is installed)
Managed Nodes → remote servers (e.g. EC2 instances)

Example:

Control Node = your vm
Managed Node = Amazon EC2 instance
Creating a cloud server such as an Amazon EC2 instance is a common approach because it provides a public IP address for remote access. However, it is not the only option—you can also work with local virtual machines (e.g. Vagrant) or physical servers.


3. Installation Requirements

On your control node:

Install:
Ansible (latest version )
Python (latest version Ansible runs on it)

Check install:

ansible --version

 4. Key Files in Ansible
 1. Inventory File

Lists your servers.

Example:

[web]
192.168.1.10
54.23.12.90

 2. Playbook (YAML file)

Written in YAML (.yml)

Example:

- name: Install nginx
  hosts: web
  become: yes
  tasks:
    - name: install nginx
      apt:
        name: nginx
        state: present


 5.  Inventory File – Access Methods

 Method 1: SSH with .pem Key (Typical Cloud – AWS)

Example:

[web]
54.23.12.90
 
all:
  hosts:
    web1:
      ansible_host: 13.53.39.227

  vars:
    ansible_user: ubuntu
    ansible_ssh_private_key_file: /home/vagrant/ansible/ansible-pair.pem
    ansible_python_interpreter: /usr/bin/python3

Used in:

Amazon Web Services
Other cloud providers

Requires:

IP address
SSH key (.pem)
Username
Python path (sometimes)


 Method 2: Passwordless SSH (Vagrant / Local Setup)


You still use SSH, but:

SSH is already configured automatically

Example:

[web]
192.168.56.10

Works because:

Vagrant auto-configures SSH keys
Your machine already trusts the VM


 6. Important Concepts

 Modules


Prebuilt tools Ansible uses.

Examples:

apt → install packages
yum → for RedHat systems
copy → copy files
src: ./config.txt
dest: /home/ubuntu/config.txt
service → manage services that run in the background instead of using systemctl

 Tasks

Each step in a playbook:

- name: install nginx
  apt:
    name: nginx

 Play

A group of tasks applied to hosts.

 Become (Privilege Escalation)

Run as root:

become: yes

 7. Basic Workflow
Create server (  EC2, Vagrant, etc.)
Install latest python and Ansible locally
Create inventory file
Write playbook
Run playbook

 8. Running Ansible
Ping test:
ansible all -m ping -i inventory
Run playbook:
ansible-playbook -i inventory playbook.yml

 9. Project Structure (Best Practice)
project/
│
├── inventory
├── playbook.yml
└── roles

 10. Common Mistakes (Important)
Thinking branches/folders are needed → not related
 Forgetting Python on remote machine
 Wrong SSH permissions:
chmod 400 key.pem
 Wrong username (e.g. ubuntu, ec2-user)

 11. Simple Mental Model

Think of Ansible as:

“Run commands on many servers from one place — automatically.”

 12. my Knowledge 

Here’s my idea :

Ansible is installed on the local machine (control node)
It uses Python internally
You connect to remote machines (like EC2) using SSH
Inventory file stores machine details (IP, user, key)
Playbooks (.yml) define tasks to run
SSH access can be:
Manual (cloud → needs key + config access)
but when Preconfiguredon vagrant  (Vagrant → works automatically)
