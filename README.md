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

# Terraform important commands

##  plan commands

###  check (dry-run) all tf files

```
fire@XIA:~/Desktop/tech/terraform/project2$ ls
ec2_create.tf  maint.tf  terraform.tfstate  terraform.tfstate.backup  vpc_create.tf
fire@XIA:~/Desktop/tech/terraform/project2$ 
fire@XIA:~/Desktop/tech/terraform/project2$ terraform  plan 

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_eip.webEIP will be created
  + resource "aws_eip" "webEIP" {
      + allocatio


=== In the last of output 

Plan: 9 to add, 0 to change, 0 to destroy.


```

### Plan againts a single resource

```
fire@XIA:~/Desktop/tech/terraform/project2$ terraform  plan  -target=aws_vpc.ashuvpc 

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_vpc.ashuvpc will be created
  + resource "aws_vpc" "ashuvpc" {
      + arn                

```


###  deploy all tf file 

```
ire@XIA:~/Desktop/tech/terraform/project2$ ls
ec2_create.tf  maint.tf  terraform.tfstate  terraform.tfstate.backup  vpc_create.tf
fire@XIA:~/Desktop/tech/terraform/project2$ 
fire@XIA:~/Desktop/tech/terraform/project2$ 
fire@XIA:~/Desktop/tech/terraform/project2$ **terraform  apply **

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_eip.webEIP will be created
  + resource "aws_eip" "webEIP" {
      + allocation_id             = (known after apply)
      + associate_with_private_ip = "10.0.1.50"
      + association_id            = (known after apply)
      + carrier_ip    


===  IN THE LAST 

Plan: 9 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value
  
```

### Deploy with auto approve

```
fire@XIA:~/Desktop/tech/terraform/project2$ terraform  apply   --auto-approve

```


  
  
