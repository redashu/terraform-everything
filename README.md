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

# Terraform state   

## after your apply command in any tf script 

###  Terraform is creating a file called "terraform.tfstate" 

### This is only responsible for all deleteing and creation  

### everytime we do either apply or delete or plan terraform.tfstate is gonna be looked

# Important :  if you made some changes in  tf script file and that is not matching with state file 

### then terraform will delete that thing from resource will create it again 

## Note: every terraform apply command is also creating a backup of current apply  so you can restore data from there 
