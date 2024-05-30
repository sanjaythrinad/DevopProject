provider "aws" {
  region  = "us-east-1"
 // profile = "default"
}

resource "aws_vpc" "sanjay-lab" {
 cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "app_subnet" {
 vpc_id = aws_vpc.sanjay-lab.id
 cidr_block = "10.0.1.0/24"
 availability_zone = "us-east-1a"
}

resource "aws_key_pair" "AWS_SSH_KEY" {
  key_name = "AWS_SSH_KEY"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLCNiSb0zj9iKK4IuKzZXNC04XRX26TSk0xalG99xUePODZ+aFcUy7pWoaTyHK2FNlzAoEDunWXvWvyPnsoYaiVgoCifc1KRCNAlJg1Mo9EOZV6Hm4cGDoYe3rQzCUX0lGPhHQzobywxn8ybAI+5W7xElYTTTja67Tkzlri1qN0UPfYzjJFJgDCq60OkxuoAY54c3Mgd4uboWLWpoZWQ3BBQgysM6+JrGCL/EAhtahfk3x3LyAV9eQvst89/27a2+nRP6iGiejtbzFxT3wYsTDl4DmjUmtHzysH91S9FtvclgaqaIIYQy1Fq9Evp7w4BvilYCOzY6jkX/YMLNxM0NlD07zq60vz8y8nVjLZSRbZIsChRuUUCpPALFcAMsaFXA+LtmGjafsYmw34e+9pZ5Ztx8hhEE+rGmVh382URYXmIHsQHiSry+LsokaeAC8DF4VFJ9FwOgfr9bz0PA0HZJ3F/VNrllvEyynCUBMKMPl6mnvNW7yau+p4eGVY9YdY1M= sanjaythrinadgm@ip-172-31-21-238"
}

resource "aws_instance" "lab-web-srv1" {
  ami           = var.instance_ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet.app_subnet.id
  key_name = "AWS_SSH_KEY"
  tags = {
    Name = "lab-web-srv1",
    Environment = "Lab",
    Application = "Testing",
    Type = "Web Server"
  }
}

//provisioner "local-exec" {
//  command = <<EOT 
//  echo "[Project1]" > Ansible/inventory.ini
//  echo "${aws_instance.lab-web-srv1.public_ip}  ansible_user=ec2-user" >> Ansible/inventory.ini
//}
