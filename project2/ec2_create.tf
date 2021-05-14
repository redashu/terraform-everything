resource "aws_instance" "ashuos1" {

    ami = "ami-077e31c4939f6a2f3"
    key_name = "helloashu"
    instance_type = "t2.micro"
    availability_zone = "us-east-2a"
    network_interface {
      device_index = 0 
      network_interface_id = aws_network_interface.ashu-nic.id
    }
    user_data = <<EOF
                #!/bin/bash
                yum install httpd -y
                echo "Hello terraform !!" >/var/www/html/index.html
                systemctl enable --now httpd
                EOF
    
    tags = {
      "Name" = "fully-vpc-Instances"
    }
}