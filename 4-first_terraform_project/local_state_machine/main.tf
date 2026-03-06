
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
# previous region not matched which was of tut
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
#updating from previous ami to freee one
  ami           = "ami-04680790a315cd58d"
  instance_type = var.instance_type
                  # previously"t3.micro" before changing for variable



  tags = {
    Name = var.instance_name

#Name = "Terraform_Demo" previously before changing for variable.tf
  }
}


