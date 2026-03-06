
variable "instance_type" {
description = "The hardware size of the server"
type        = string
default     = "t3.micro"
}

variable "instance_name" {
description = "The name tag for the EC2 instance"
type        = string
default     = "My-Terraform-Server"
}

