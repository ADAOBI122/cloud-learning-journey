#!/bin/bash
# setup_ec2_app.sh
# Detailed setup for EC2 instance: updates, Git, Nginx and UFW

# --- Step 1: Update & Upgrade the system ---
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# --- Step 2: Install essential tools ---
echo "Installing Git..."
sudo apt install git -y

echo "Installing Nginx..."
sudo apt install nginx -y

echo "Installing UFW..."
sudo apt install ufw -y

# --- Step 3: Configure UFW (uncomplicated firewall) ---
echo "Configuring firewall..."
sudo ufw allow OpenSSH
sudo ufw allow 80
sudo ufw allow 443
sudo ufw --force enable
sudo ufw status verbose

# --- Step 4: Start & enable Nginx ---
echo "Starting and enabling Nginx..."
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx 


