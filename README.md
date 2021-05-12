# Terraform in most simplest way 

## Here you can learn from ABC to XYZ of terraform 

## Important information 

<ul> 
   <li> Open Source IAC TooL </li>
   <li> Created by HashiCorp </li>
   <li> It has Declarative COnfiguration language called [HCL] --> HashiCorp Configuration Language </li>
   <li> Written in Go lang </li> 
   <li> Terraform Github link [Github](https://github.com/hashicorp/terraform) </li>   
   <li>  Official Docs [terraformDocs](https://www.terraform.io/docs/index.html) </li>
   <li> First release : July 28 2014 </li>
  
</ul>

# terraform apply --> facts 

## Fact 1 : 

## Important:  
### THis is really important to understand that a terraform directory can have more than one .tf file 
###  No file will be having duplicate entry 


## Fact 2 :  

### to auto approve apply 

```
fire@XIA:~/Desktop/tech/terraform/project1$ terraform destroy   --auto-approve

aws_vpc.main: Refreshing state... [id=vpc-0609b4205f4bc8cc0]
aws_vpc.main: Destroying... [id=vpc-0609b4205f4bc8cc0]
aws_vpc.main: Destruction complete after 1s

```

## Fact 3 : 

### IF we want to apply / destroy a particular resource 

```

fire@XIA:~/Desktop/tech/terraform/project1$ ls
maint.tf  terraform.tfstate  terraform.tfstate.backup  vpc.tf
fire@XIA:~/Desktop/tech/terraform/project1$ cat  vpc.tf 
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "testing-vpc"
  }
}fire@XIA:~/Desktop/tech/terraform/project1$ terraform apply --target=aws_vpc.main  --auto-approve
aws_vpc.main: Creating...
aws_vpc.main: Still creating... [10s elapsed]
aws_vpc.main: Creation complete after 13s [id=vpc-09a035c7e386525d5]
╷
│ Warning: Resource targeting is in effect
│ 

```

