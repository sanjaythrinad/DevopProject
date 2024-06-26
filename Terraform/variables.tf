variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "app_subnet_cidr_block" {
  description = "CIDR block for the first subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "db_subnet_cidr_block" {
  description = "CIDR block for the second subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone_1" {
  description = "Availability zone for the first subnet"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zone_2" {
  description = "Availability zone for the second subnet"
  type        = string
  default     = "us-east-1b"
}

variable "instance_ami" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-0fe630eb857a6ec83"
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "server_1_name" {
  description = "Name tag for the first DevOps server"
  type        = string
  default     = "appserver"
}

variable "server_2_name" {
  description = "Name tag for the second DevOps server"
  type        = string
  default     = "dbserver"
}
