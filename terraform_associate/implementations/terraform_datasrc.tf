# we need to use data source to use/refer any existing external resources 
# like ec2 and vpc are two different things 

data "aws_security_group" "ashu-sec-sg" {
  id = "sg-0cecdd3b9f665d912" # id of default security group / we can give any existing
}



resource "aws_instance" "ashuvm" {
  ami           = "ami-01a4f99c4ac11b03c"
  instance_type = "t2.small"
  key_name      = "ashu-private-key" # already existing 
  vpc_security_group_ids = [data.aws_security_group.ashu-sec-sg.id]
  tags = {
    "Name" = "ashuvm00790"
  }

}

