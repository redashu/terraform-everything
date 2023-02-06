
resource "aws_instance" "ashuvm" {
  ami           = "ami-01a4f99c4ac11b03c"
  instance_type = "t2.small"
  key_name      = "ashu-private-key" # already existing 
  
  tags = {
    "Name" = "ashuvm00790"
  }

}

