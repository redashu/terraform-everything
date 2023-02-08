# Reference the specific VPC using its ID
data "aws_vpc" "my_vpc" {
  id = "vpc-0450e556b14d3a4a7"
}

# Create a security group
resource "aws_security_group" "my_security_group" {
  name        = "my_security_group"
  description = "Allows SSH and HTTP access"
  vpc_id      = data.aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance
resource "aws_instance" "my_instance" {
  ami           = "ami-01a4f99c4ac11b03c"
  instance_type = "t2.small"

  vpc_security_group_ids = [aws_security_group.my_security_group.id]

  tags = {
    Name = "my_instance"
  }
}
