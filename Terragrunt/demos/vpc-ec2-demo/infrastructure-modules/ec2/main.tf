terraform {
  backend "s3" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}
variable "name" {
  description = "Name prefix for resources"
  type        = string
  default     = "demo"
}

variable "region" {
  type = string
  
}

variable "vpc_id" {
  description = "VPC ID where the SG will be created"
  type        = string
}

variable "subnet_id" {
  description = "Public subnet ID where the instance will be launched"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "tags" {
  description = "Additional tags to apply"
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "Optional user data script"
  type        = string
  default     = null
}


output "instance_id" {
  value = aws_instance.this.id
}

output "public_ip" {
  value = aws_instance.this.public_ip
}

output "security_group_id" {
  value = aws_security_group.this.id
}

provider "aws" {
  region = var.region
  
}

# NOTE: No provider block here — let root/Terragrunt set the AWS provider/region.

# Security Group allowing SSH (22) and HTTP (80)
resource "aws_security_group" "this" {
  name        = "${var.name}-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "${var.name}-sg" })
}

# Single EC2 instance in the provided public subnet
resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.this.id]
  associate_public_ip_address = true

  # Optional: uncomment if you want user data
  # user_data = var.user_data

  tags = merge(var.tags, { Name = "${var.name}-ec2" })
}

