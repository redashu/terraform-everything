terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.10.0"
    }
  }
  backend "s3" {
    bucket         = "ashubackstores"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "ashu-lock-table"
    acl            = "private"
  }
}

provider "aws" {
  region = "ap-south-1"


}

resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo Hello, World!"
  }

}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucketashutoshh"

  tags = {
    Name        = "ashutoshhh"
    Environment = "Dev"
  }
}


