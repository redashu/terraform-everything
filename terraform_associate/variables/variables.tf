variable "inst_details" {
  description = "instance type we need to give.."
  type        = string
  default     = "t2.micro"

}

variable "ami-details" {
  description = "details of ami in aws"
  type        = string
  default     = "ami-01a4f99c4ac11b03c"

}

variable "count1" {
  type        = number
  description = "no of instances"
  default     = 2

}

variable "bool1" {
  type        = bool
  default     = true
  description = "using in places like EIP required or not"
}

variable "arrayvar" {
  type    = list(string) # list of strings
  default = ["user11", "user22", "user33"]

}

