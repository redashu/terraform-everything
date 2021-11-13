provider "aws" {

    region = "us-east-2"  #  THis is aws Ohio region 
    access_key = "AKIAQ4OUTXWCWYIKZS2A"
    secret_key = "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"
}

#resource "<provider>_<resourcetype>" "anyname" {
    # config options 
    # key 1 = value 1 
  
#}
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "key_name111"
  public_key = tls_private_key.example.public_key_openssh
  provisioner "local-exec" { # Create "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.example.private_key_pem}' > ./ashu.pem"
  }
}

resource "aws_instance" "firstvm1" {

    ami = "ami-0dd0ccab7e2801812"
    instance_type = "t2.micro"
    
    key_name = "ashutoshhkey"
    tags = {
      "Name" = "Os1"
    }

}

output "myout" {
    value = "${aws_instance.firstvm1.public_ip} and ${aws_instance.firstvm1.id}"
    
  
}
