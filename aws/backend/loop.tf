variable "instances" {
  default = {
    app1 = "ami-0861f4e788f5069dd"
    app2 = "ami-0cf8ec67f4b13b491"
    app3 = "ami-02d26659fd82cf299"
  }
}

resource "aws_instance" "web" {
  for_each = var.instances

  ami           = each.value
  instance_type = "t2.micro"

  tags = {
    Name = each.key
  }
}
