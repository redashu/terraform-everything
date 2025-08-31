terraform {
  source = "../../../infrastructure-modules/vpc"
}

inputs = {
  vpc_name           = "ashu-dev-vpc"
  vpc_cidr               = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  region             = "ap-south-1"   # provider info
  tags = {
    Environment = "dev"
    Project     = "TerragruntDemo"
  }
}
