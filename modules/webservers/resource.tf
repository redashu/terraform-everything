resource "aws_instance" "web" {
  ami           = "ami-02d1e544b84bf7502"
  key_name      = "vodakey"
  instance_type = "t2.micro"

}