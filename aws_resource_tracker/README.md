# AWS Resource Tracker

A lightweight Bash script designed to automate the monitoring of AWS cloud resources. This tool provides a daily snapshot of active services to help manage cloud usage and prevent unnecessary costs.

## 🚀 Purpose
When working with AWS, it's easy to leave instances or functions running, which can lead to unexpected charges. This script automates the "daily check" by generating a clean text report of your:
* **S3 Buckets** (Storage)
* **EC2 Instances** (Virtual Machines)
* **Lambda Functions** (Serverless)
* **IAM Users** (Security/Identity)

## 🛠️ Prerequisites
Before running the script, ensure your environment is set up:
1. **AWS CLI installed** - [Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
2. **AWS CLI Configured** - Run `aws configure` and provide your Access Keys.
3. **jq Installed** - This script uses `jq` to parse JSON output.
   - *Ubuntu/Debian:* `sudo apt install jq`
   - *MacOS:* `brew install jq`
