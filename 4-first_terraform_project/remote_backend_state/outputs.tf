
output "instance_id" {
description = "The ID of the EC2 instance"
value       = aws_instance.app_server.id
}

output "instance_public_ip" {
description = "The public IP address of the server"
value       = aws_instance.app_server.public_ip
}

output "instance_status" {
description = "The current state of the instance"
value       = aws_instance.app_server.instance_state
}



