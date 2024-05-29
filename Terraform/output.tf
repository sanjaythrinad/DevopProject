output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.sanjay-lab.id
}

output "subnet_1_id" {
  description = "The ID of the first subnet"
  value       = aws_subnet.web_subnet.id
}

output "subnet_2_id" {
  description = "The ID of the second subnet"
  value       = aws_subnet.db_subnet.id
}

output "devops_server_1_id" {
  description = "The ID of the first DevOps server"
  value       = aws_instance.lab-web-srv1.id
}

output "devops_server_2_id" {
  description = "The ID of the second DevOps server"
  value       = aws_instance.lab-db-srv1.id
}


output "devops_server_1_private_ip" {
  description = "The private IP of the first DevOps server"
  value       = aws_instance.lab-web-srv1.private_ip
}

output "devops_server_2_private_ip" {
  description = "The private IP of the second DevOps server"
  value       = aws_instance.lab-db-srv1.private_ip
}

