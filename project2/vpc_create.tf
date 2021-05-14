resource "aws_vpc" "ashuvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "tempvpc"
  }
}

# creating Internet gateway 

resource "aws_internet_gateway" "ashugw" {
  vpc_id = aws_vpc.ashuvpc.id

  tags = {
    Name = "ashugw1"
  }
}

# creating route table

resource "aws_route_table" "ashuroute" {
  vpc_id = aws_vpc.ashuvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ashugw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.ashugw.id
  }

  tags = {
    Name = "ashur"
  }
}

# creating subnet

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.ashuvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "pubsub-1"
  }
}

# Route table association 
resource "aws_route_table_association" "ashurouteasso" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.ashuroute.id
}

# creating security group and allow 22 , 80 , 443 ports

resource "aws_security_group" "allow_customport" {
  name        = "allow_webtr"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.ashuvpc.id

     # rules 
  ingress {
    description = "https from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
   # cidr_blocks = [aws_vpc.main.cidr_block]
    cidr_blocks = ["0.0.0.0/0"] # from all sources 
  }

ingress {
    description = "http from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # from all sources 
  }

ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # from all sources 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_web"
  }
}

# creating NIC into above created subnet

resource "aws_network_interface" "ashu-nic" {
  subnet_id       = aws_subnet.public.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.allow_customport.id]

  #attachment {
  #  instance     = aws_instance.test.id --> will do this during net creation time
  #  device_index = 1
  #}
}

# creating EIP and  attaching to NIC 

resource "aws_eip" "webEIP" {
  vpc                       = true
  network_interface         = aws_network_interface.ashu-nic.id
  associate_with_private_ip = "10.0.1.50"
  depends_on = [aws_internet_gateway.ashugw] # here we don't need ID
  # EIP depends on aws gateway so this needs to be created first 
}