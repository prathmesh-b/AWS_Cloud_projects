#!/bin/bash


######################
# Author : Prathmesh
# Date : 19-2-26
#
# Version : v1

# This script will report the AWS resource usuage
######################

#debugg mode
set -x

# We are going to track following :

# AWS S3
# AWS EC2
# AWS LAMBDA
# AWS IAM Users


# list s3 buckets
echo -e "Print list of s3 buckets\n"
aws s3 ls > resourceTracker.txt


# list ec2 instances
echo -e  "Print list of ec2 instances / virtual machines\n"
#aws ec2 describe-instances  previous command which give extra info which we confuse user
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourceTracker.txt

# list lambda 
echo -e  "Print list of lambda functions\n "
aws lambda list-functions >> resourceTracker.txt

# list IAM users
echo -e "Print list IAM users\n"
aws iam list-users >> resourceTracker.txt

echo "Report generated in resourceTracker.txt"

