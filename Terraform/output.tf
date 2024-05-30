output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.sanjay-lab.id
}

output "subnet_1_id" {
  description = "The ID of the first subnet"
  value       = aws_subnet.app_subnet.id
}

output "devops_server_1_id" {
  description = "The ID of the first DevOps server"
  value       = aws_instance.lab-web-srv1.id
}

output "devops_server_1_private_ip" {
  description = "The private IP of the first DevOps server"
  value       = aws_instance.lab-web-srv1.private_ip
}

output "devops_server_1_private_ip" {
  description = "The private IP of the first DevOps server"
  value       = aws_instance.lab-web-srv1.public_ip
}
