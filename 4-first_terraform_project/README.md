# 🚀 AWS Infrastructure with Terraform & Remote Backend S3 Bucket, DYANMO DB

This project automates the deployment of an AWS EC2 instance using **Terraform** for Iaac Infrastructure as code. It is architected for a professional DevOps environment, utilizing a **Remote Backend** for state management and collaboration.



## 🏗️ Architecture Overview
Unlike a basic local setup, this project follows the industry "Gold Standard":
* **State Storage:** Amazon S3 (Provides a single source of truth).
* **State Locking:** Amazon DynamoDB (Prevents concurrent executions and state corruption).
* **Infrastructure:** AWS EC2 Instance (Standardized via variables).

## 📂 Project Files
```text
.
├── backend.tf       # Configures S3 & DynamoDB for remote state
├── main.tf          # Core logic (EC2 Resource)
├── variables.tf     # Input variables for flexibility
├── outputs.tf       # Useful data (Public IP, Instance ID)
└── .gitignore       # Ensures secrets and local files aren't pushed to GitHub
```
## 🛠️ Prerequisites

Before running this code, ensure you have the following configured:

* **AWS CLI**: Authenticated with valid credentials (`aws configure`).
* **Terraform**: Installed on your local machine.
* **S3 Bucket & DynamoDB Table**: Created and matching the names specified in `backend.tf`.



## 🚀 How to Use

### 1. Initialize
Download the necessary providers and connect to the S3 remote backend.
```bash
terraform init
```

### 2. Plan
Review the execution plan to see what resources will be created, modified, or destroyed.

```bash
terraform plan
```

### 3. Apply
Deploy the infrastructure to your AWS account.

```bash
terraform apply -auto-approve
```

### 📋 Variables
Name = instance_type
Description = The hardware size of the server
Default = t3.micro

Name = instance_name
Description = The tag name for the server
Default = My-Terraform-Server

### 🛡️ State Locking
This project uses DynamoDB for state locking.

If you attempt to run an apply while another team member is already executing a change, Terraform will trigger a Locked error. This prevents two people from modifying the same resource at the same time, which would otherwise corrupt the state file.

### 💡 Pro-Tip for people who want to try this project 
Since you trying to try this project it has  **Remote Backend**, anyone who clones this repo will need to change the bucket name in `backend.tf` to their own bucket, or they will get an "Access Denied" error. 


### 📊 Terraform State Comparison

| Feature | Local Folder | Remote Folder |
| :--- | :--- | :--- |
| **`backend.tf` present?** | No | **Yes** |
| **Where is the "Brain"?** | On your Laptop | In **Amazon S3** |
| **Can a teammate see it?** | No | **Yes** |
| **Safety** | Low (Laptop can break) | **High (S3 is durable)** |
| **State Locking?** | No | **Yes (via DynamoDB)** |