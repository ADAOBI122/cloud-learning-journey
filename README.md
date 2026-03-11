# Cloud Development Workflow

This repository documents the **cloud development workflow** I have learned and practiced, including using virtual machines, version control, firewalls, and deployment preparation. It demonstrates my understanding of **VM management, Git, security, and cloud deployment basics**.

---

## Local Development Environment Setup

1. **Install VirtualBox**  
   VirtualBox is used to create and run virtual machines (VMs) on the local computer.

2. **Install Vagrant**  
   Vagrant is used to **automate VM creation and management** within VirtualBox.  


2b. create a Folder for the VM Environment

First create a folder where the VM configuration will live.

mkdir dev-environment
cd dev-environment

This folder will contain:

dev-environment/
 ├── Vagrantfile
 └── (optional provisioning scripts)

Now initialize Vagrant.

  Commands:
   ```bash
   vagrant init        # Initialize a new Vagrant environment
   vagrant up          # Start the VM
   vagrant ssh         # Access the VM via SSH


3. ** Enter the VM**
  Using vagrant ssh, I can open the VM terminal and work as if I were on a separate Linux machine. 


4. ** work Inside the VM**

   *Prepare the VM (Security + Packages)*

Inside the VM you can install things like:

updates

firewall

git

programming tools
Example:

sudo apt update
sudo apt install git -y
sudo apt install ufw -y

Firewall setup:

Using UFW(uncomplicated firewall)

sudo ufw allow 22 (ssh)
sudo ufw enable

This controls network traffic entering the VM.



5. **now Create the Project Folder**

Inside the VM you create your project workspace.

Example:

mkdir projects
cd projects



6. ** Initialize Git in the Project**

Inside the project folder initialize:

Git

git init

Now Git will track:

files

changes

commits

history


7. **create Documentation**

Create a README file.

README.md

This explains:

project description and requirements.




8. **Create a Setup Script**

You can create a shell script that records commands used to configure the system.

Example:

setup.sh


9. **push Project to Git Repository**


But first create a Repository on GitHub go to GitHub in your browser.

Step1:

Click New Repository

Enter repository name (example: myapp)

Choose public or private

Click Create repository

GitHub will show instructions for connecting your local project.

step2: generate an SSH Key on the VM

Your VM must authenticate with GitHub securely.

Generate a key:

ssh-keygen 

Used when pushing/pulling from GitHub over SSH.

Replace the need to type a username/password every time.

Does not create commits — it just authenticates your VM with GitHub.


9b.** How SSH keys work with GitHub**

Generate SSH key on your VM:

ssh-keygen

Press Enter to accept default location (~/.ssh/id_ed25519)

Optional: add a passphrase (adds extra security)

Copy your public key:

cat .ssh/id_rsa.pub

This prints the key — copy everything.

Add it to GitHub:

Go to Settings → SSH and GPG keys → New SSH key

Paste your public key, give it a title, save

Test the connection:

ssh -T git@github.com

You should see:

Hi ADAOBI122! You've successfully authenticated, but GitHub does not provide shell access.


10. **pushing commits using SSH**

Once the key is added, you can now push :

git remote add origin git@github.com:ADAOBI122/cloud-learning-journey.git
git push -u origin master

git@github.com: → SSH format

You no longer need a password, SSH handles authentication.


##  Key points

You still need to commit locally (git add + git commit).

SSH keys only replace the need for GitHub username/password when pushing or pulling.

Using SSH is recommended — safer than HTTPS passwords.



11. Deploy to the Cloud.
