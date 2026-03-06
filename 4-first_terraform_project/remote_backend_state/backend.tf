terraform {
  backend "s3" {
    bucket         = "project-terraform-state-bucket-unique-243" # Use your bucket name
    key            = "dev/terraform.tfstate"           # Where the file will live in S3
    region         = "us-direction-0"            
    dynamodb_table = "terraform-state-locking"         # The lock table name
    encrypt        = true                               # Keep the state file encrypted
  }
}
