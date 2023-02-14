resource "aws_instance" "ashu-vm007" {
  ami = var.y
  instance_type = var.x
  
}

variable "x" {
  type = string
}

variable "y" {
  type = string 
  validation {
    condition     = length(var.y) > 4 && substr(var.y, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
  validation {
    condition = can(regex("^ama-",var.y))
    error_message = "image is not starting with ami keyword"
  }
  
}
