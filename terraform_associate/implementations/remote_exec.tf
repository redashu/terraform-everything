data "aws_security_group" "ashu-existing-sg" {
    id = "sg-0cecdd3b9f665d912"
}

resource "aws_key_pair" "new-key" {
  key_name = "ashu-key-by-tf"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDw4PriCdLwTiUFGWuSZJAD4biajyHNuSgyED1OHTJHp9/0xLjJDt7qvZGg9e7KTlL/BE9l03Ado/G27x25b8UL2LTYCkddyQcj56tp3jjvNWebH8zFE1FBymrinMV0yh0hurqJ7sPmVZd4tRX4Qgq0Ec30BAw8Mb+D9o8AhwuPDtLKF4GIC6u4FFEeo3Nd90DTKPf7+s7VbS/F1ap5VZd8hLNkWCn/hRxVDMJvUY2WrrbqHEnzJWLwY3imVakBcprY6X415ibntsE008RZFUHcvYM4heTUD2++h5yiEuHs+i5Cti4JM9niZ0gdwN/SCsBI6ZZnpukZJjU93BtD/R9Wr3e5QbUlJlauGPSqLZyFedID5rAV1OoqOUqdcVvA9kwwybsLt9Wwus0O0HqGPJ4OpQFS/RPlJ+4CG8KnFev9YWtBvWd3LsylHSj6Eni44GkghlV8HYHcps39ZyEpYK9d0st1tCN+Ex/UmLGHeW/c9Jnz0prfl1A92MxP3co1hL0= fire@ashutoshhs-MacBook-Air.local"
}

resource "aws_instance" "vm00file" {
    ami = "ami-01a4f99c4ac11b03c"
    key_name = "${aws_key_pair.new-key.key_name}"
    instance_type = "t2.micro"
    vpc_security_group_ids = [data.aws_security_group.ashu-existing-sg.id]
    provisioner "file" {
      source = "/tmp/a.py"
      destination = "/home/ec2-user/run.py"
      
    }
    provisioner "remote-exec" {
      inline = [
        "touch hellorm.txt",
        "echo have a great day .. >>hellotime.txt",
        "yum install python3 -y",
        "python3 /home/ec2-user/run.py"
      ]

   # we can run local script into remote target using script or scripts keywords 
   provisioner "remote-exec" {
      scripts = [ 
         "./my-scripts/web.sh", # these scripts are stored in local terraform machine 
         "./my-scripts/web1.sh"
       ]
      #scripts = "./my-scripts/web.sh" # to execute script 
      # inline = [ 
      #   "chmod +x /tmp/web.sh",
      #   "/tmp/web.sh args"  # only when we need to pass some argument then we can use inline to run script 
      #   ]
    }
# Defining connection details 
    }
    connection {
      type = "ssh"
      user = "ec2-user"
      timeout = "3m"
      host = self.public_ip
      private_key = file("/Users/fire/.ssh/id_rsa")
    }

  
}
