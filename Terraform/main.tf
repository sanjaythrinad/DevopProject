terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.49.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
 // profile = "default"
}


resource "aws_vpc" "sanjay-lab" {
 cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "app_subnet {
 vpc_id = aws_vpc.sanjay-lab.id
 cidr_block = "10.0.1.0/24"
 availability_zone = "us-east-1a"
}

resource "aws_subnet" "db_subnet" {
 vpc_id = aws_vpc.sanjay-lab.id
 cidr_block = "10.0.2.0/24"
 availability_zone = "us-east-1b"
}

resource "aws_instance" "lab-web-srv1" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.app_subnet.id

  tags = {
    Name = "lab-web-srv1",
    Environment = "Lab",
    Application = "Testing",
    Type = "Web Server"
  }
}

resource "aws_instance" "lab-db-srv1" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.db_subnet.id

  tags = {
    Name = "lab-db-srv1",
    Environment = "Lab",
    Application = "Testing",
    Type = "DB Server"
  }
}
