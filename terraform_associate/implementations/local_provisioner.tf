# we need to use data source to use/refer any existing external resources 
# like ec2 and vpc are two different things 
# using data source for referencing VPC 
# data source for using existing vpc 
data "aws_security_group" "ashu-sec-sg" {
  id = "sg-0cecdd3b9f665d912" # id of default security group / we can give any existing
}

data "aws_security_group" "ashu-sec-sg1" {
  id = "sg-0c46398c65521c995"
}
# refering cloud-init script 
data "template_file" "user_data" {
  template = file("./cloud-init.yaml")
}

# creating aws key pair 
resource "aws_key_pair" "new-key" {
  key_name = "ashu-key-by-tf"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDw4PriCdLwTiUFGWuSZJAD4biajyHNuSgyED1OHTJHp9/0xLjJDt7qvZGg9e7KTlL/BE9l03Ado/G27x25b8UL2LTYCkddyQcj56tp3jjvNWebH8zFE1FBymrinMV0yh0hurqJ7sPmVZd4tRX4Qgq0Ec30BAw8Mb+D9o8AhwuPDtLKF4GIC6u4FFEeo3Nd90DTKPf7+s7VbS/F1ap5VZd8hLNkWCn/hRxVDMJvUY2WrrbqHEnzJWLwY3imVakBcprY6X415ibntsE008RZFUHcvYM4heTUD2++h5yiEuHs+i5Cti4JM9niZ0gdwN/SCsBI6ZZnpukZJjU93BtD/R9Wr3e5QbUlJlauGPSqLZyFedID5rAV1OoqOUqdcVvA9kwwybsLt9Wwus0O0HqGPJ4OpQFS/RPlJ+4CG8KnFev9YWtBvWd3LsylHSj6Eni44GkghlV8HYHcps39ZyEpYK9d0st1tCN+Ex/UmLGHeW/c9Jnz0prfl1A92MxP3co1hL0= fire@ashutoshhs-MacBook-Air.local"
}

resource "aws_instance" "ashuvm" {
  ami           = "ami-01a4f99c4ac11b03c"
  instance_type = "t2.small"
  key_name      = "${aws_key_pair.new-key.key_name}"
  vpc_security_group_ids = [data.aws_security_group.ashu-sec-sg.id,data.aws_security_group.ashu-sec-sg1.id]
  
  tags = {
    "Name" = "ashuvm00790"
  }
  user_data = data.template_file.user_data.rendered
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >>ec2_public_ip.txt"
    
  }
  provisioner "local-exec" {
    when = destroy
    command = "echo date >>last.txt"
    
  }
  provisioner "local-exec" {
    when = create
    command = "/tmp/a.py"
    interpreter = [
      "python3"
    ]
    
  }

}

