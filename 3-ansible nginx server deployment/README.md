# Ansible: AWS EC2 Web Server Automation with Ansible

This project demonstrates how to use **Ansible** to automate the deployment of an **Nginx Web Server** on **AWS EC2 (Ubuntu)**. It handles everything from system updates to deploying a custom landing page.

## 🏗️ Architecture
- **Control Node:** AWS EC2 Ubuntu Instance (Ansible installed)
- **Managed Node (Target):** AWS EC2 Ubuntu Instance
- **Connection:** SSH Key-based authentication via Private IP (within same VPC)
- **Service:** Nginx running on Port 80



## 📋 Prerequisites
Before running this playbook, ensure you have:
1. Two AWS EC2 Ubuntu instances running.
2. SSH access from the Control Node to the Target Node.
3. The Target Node's **Public Key** appended to `~/.ssh/authorized_keys`.

## 🚀 Setup & Deployment

### 1. Clone the Repository
After clone follow next step
cd ansible-nginx-server-deployment

### 2. Configure Inventory
Update the inventory file with your Target Server's Private IP address:

Ini, TOML
```bash
[targets]
172.31.X.X ansible_user=ubuntu
```

### 3. Run the Playbook
Execute the following command to start the automation:

```bash
ansible-playbook -i inventory first-playbook.yml
```

## 📂 Project Structure

1. first-playbook.yml: The Ansible playbook containing tasks for Nginx installation.
2. inventory: List of target servers and connection details.
3. index.html: The custom web content to be deployed.
4. README.md: Project documentation.

## 🛠️ Tasks Performed
- Update Cache: Ensures apt is up to date.
- Install Nginx: Downloads and installs the Nginx web server.
- Deploy Content: Transfers index.html to /var/www/html/.
- Service Management: Ensures Nginx is started and enabled on boot.


## 🌐 Verification
Once the playbook completes, visit the Public IP of your target server in any browser:
http://<TARGET_PUBLIC_IP>

