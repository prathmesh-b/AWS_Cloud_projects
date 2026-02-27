# 🚀 Node.js Deployment on AWS EC2
### Deployment Log & Documentation

This document outlines the steps I followed to successfully deploy this Node.js application on a remote AWS EC2 instance. 

---

## 💻 Phase 1: Local Environment Testing
Before moving to the cloud, I verified the application locally to ensure the environment configuration was stable and app should be running on localhost.

1.  **Cloned the repository:**
    ```bash
    git clone [nodejsapp](https://github.com/verma-kunal/AWS-Session.git)
    cd AWS-Session
    ```
2.  **Configured Environment Variables:**
    I created a `.env` file in the root directory with the following credentials:
    ```env
    DOMAIN="localhost"
    PORT=3000
    STATIC_DIR="./client"
    PUBLISHABLE_KEY="your_stripe_publishable_key"
    SECRET_KEY="your_stripe_secret_key"
    ```
3.  **Initialized the project:**
    ```bash
    npm install
    npm run start
    ```
    *Verified that the app was reachable at `http://localhost:3000`.*

---

## ☁️ Phase 2: AWS Infrastructure Setup
Once local testing was complete, I provisioned the necessary hardware on AWS.

## Creation of IAM User other than main AWS root account
* **Created an IAM User:** I set up a dedicated user with **Password Access** and **Administrator Access** permissions to manage the resources. I don't want to deploy on root email account / admin AWS account.

### 🛰️ EC2 Provisioning
I launched an EC2 instance with the following specifications:
* **OS Image:** Ubuntu 22.04 LTS
* **Instance Type:** `t2.micro` (Free Tier eligible)
* **Key Pair:** Generated a `.pem` file for secure SSH access.
* **Elastic IP:** I allocated and associated an **Elastic IP Address** to the instance to ensure the `DOMAIN` remains constant even after restarts.

### 🔑 IAM & Security

* **Security Groups:** I configured the Inbound Rules to allow traffic on **Port 3000** (Custom TCP) so the application could be accessed externally.

---

## 🛠️ Phase 3: Remote Server Configuration
After the instance was running, I connected via SSH and prepared the Ubuntu environment.

1.  **Connected to the Instance:**
    ```bash
    ssh -i "your-key.pem" ubuntu@<YOUR_ELASTIC_IP>
    ```
2.  **System Updates:**
    ```bash
    sudo apt update && sudo apt upgrade -y
    ```
3.  **Dependency Installation:**
    * Installed **Git** for version control.
    * Installed **Node.js** and **npm** using the NodeSource repository to ensure the correct version was available.

---

## 🚀 Phase 4: Final Deployment
With the server ready, I performed the final deployment steps on the remote VM.

1.  **Cloned the project** directly onto the server:
    ```bash
    git clone [nodejsappsample](https://github.com/verma-kunal/AWS-Session.git)
    ```
2.  **Configured the Production `.env`:**
    * Updated the `DOMAIN` variable to match my **AWS Elastic IP**.
    * Set the `PORT` to 3000.
3.  **Launched the App:**
    ```bash
    npm install
    npm run start
    ```

---

## 📝 Important Notes & Observations

> [!IMPORTANT]
> * **Security Group Rules:** I specifically edited the **Inbound Rules** to allow traffic on port 3000. By default, AWS blocks all ports except 22 (SSH), so this step was critical for public access.
> * **Elastic IP Persistence:** I used an **Elastic IP** because standard Public IPs change when an instance is stopped/started. This ensures the `DOMAIN` link stays the same.
> * **SSH Permissions:** I had to set the correct permissions on my `.pem` file (`chmod 400`) to avoid the "unprotected private key file" error during login.
> * **Environment Sync:** I ensured the `.env` variables on the server matched the code logic, specifically pointing the `STATIC_DIR` to the correct client folder.

---

## ✅ Final Result
The project is successfully deployed on AWS! 🎉 You can access the live application via the Elastic IP on port 3000. (_EC2instance has been terminated_)