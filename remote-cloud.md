# My Cloud & Web Deployment Learning Journey

## Overview
This document details my hands-on learning journey of deploying a web application on an **AWS EC2 instance**. It includes **provisioning the instance**, **connecting via SSH**, **setting up the server**, and **hosting a simple HTML page**.  

All commands are captured in a `.sh` file for automation and reproducibility.

---

## 1. Provisioning an EC2 Instance on AWS

1. Log in to **AWS Management Console**.
2. Navigate to **EC2 → Instances → Launch Instance**.
3. Choose **Ubuntu 24.04 LTS** as the AMI and name tne instance.
4. Select an instance type (e.g., **t2.micro** for free tier).
5. Configure instance details (default VPC and subnet).
6. Add storage if needed (default 8 GB is sufficient).
7. **Create a new key pair**:
   - Name: `key-payroll.pem`
   - Download the `.pem` file.
   - Keep it safe; this is required for SSH access.
8. Configure **security groups**:
   - Allow SSH (port 22) from your IP.
   - Allow HTTP (port 80) and HTTPS (port 443) for web traffic.
9. Launch the instance.

---

## 2. Connecting via SSH

1. Move the `.pem` file to a secure location on your local machine copy the content of the .pem file from note on your host machine . on your cli use the nano editor to open the .pem file name it correctly as the same name of the.pem file oon your host computer then paste the exact content you copied and save *ctrl + O* then exit *ctrl +x* .
2. Set correct permissions:

```bash
chmod 400 key-payroll.pem

Connect to the instance:

ssh -i "key-payroll.pem" ubuntu@<EC2-PUBLIC-IP>

Replace <EC2-PUBLIC-IP> with your instance’s public IP.

You should see:

Welcome to Ubuntu 24.04.4 LTS (GNU/Linux)
ubuntu@ip-<EC2-IP>:~$
3. Update and Upgrade the System

Always ensure your system is up to date:

sudo apt update
sudo apt upgrade -y

This updates package lists and installs all security and software updates.


4. Install Essential Tools

4.1. Git
sudo apt install git -y
git --version

Git is required to pull code from repositories.

4.2 Nginx (Web Server)
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx

Nginx serves as the web server for hosting applications.


4.3 UFW (uncomplicated Firewall)
sudo apt install ufw -y
sudo ufw allow OpenSSH
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable
sudo ufw status

UFW secures the server and ensures only allowed ports are open.
Test via browser: http://<EC2-PUBLIC-IP> → shows “Welcome to Nginx”.


5. AWS Security Group Check

Confirm AWS Security Group allows inbound traffic:

SSH → port 22 → your IP

HTTP → port 80 → 0.0.0.0/0

HTTPS → port 443 → 0.0.0.0/0


6. Prepare the server

Update it:

sudo apt update

Install git:

sudo apt install git -y

7. Bring your project into the server

Now you want your GitHub project here.

git clone https://github.com/YOUR_USERNAME/crontab-exercise.git

Prepare /var/www/html

Remove nginx default files:

sudo rm -rf /var/www/html/*

copy your project into /var/www/html/
sudo cp -r ~/project-folder-name/* /var/www/html/

/var/www/html/: is where the web server looks for file to serve to visitors .

8. change permission make nginx the owner of the files.
sudo chown -R www-data:www-data /var/www/html/

sudo chmod -R 755   /var/www/html/

9. Reload nginx so changes can apply .
sudo systemctl reload nginx . 
