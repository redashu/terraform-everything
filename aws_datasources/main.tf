provider "aws" {
  region     = "us-east-2"
  access_key = "AKXMO2UFZ"
  secret_key = "CyoskuNsAUMDkK64ktD5685EK2CPwHL"
}

data "aws_ami" "image1" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

output "image-id" {
  value = data.aws_ami.image1.id

}

resource "aws_instance" "web" {
  ami           = data.aws_ami.image1.id
  key_name      = "vodakey"
  instance_type = "t2.micro"

}
