terraform {
  source = "../../../infrastructure-modules/ec2"
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
    vpc_id        = "vpc-mock-id"
    public_subnet_id = "subnet-mock-id"
  }
}

inputs = {
  name          = "ashu-dev-ec2"
  ami_id        = "ami-0861f4e788f5069dd"
  instance_type = "t3.micro"
  region        = "ap-south-1"  # provider info
  vpc_id        = dependency.vpc.outputs.vpc_id
  subnet_id     = dependency.vpc.outputs.public_subnet_id
  tags = {
    Environment = "dev"
    Project     = "TerragruntDemo"
  }
}
