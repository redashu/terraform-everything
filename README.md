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

# Provisoining aws resources using terraform 

## we gonna use aws as provider

### creating a project directory  in Ubuntu Machine 

```
fire@XIA:~/Desktop/tech/terraform/project1$ mkdir  -p  ~/Desktop/tech/terraform/project1/
fire@XIA:~/Desktop/tech/terraform/project1$ 
fire@XIA:~/Desktop/tech/terraform/project1$ ls
maint.tf

```

##  Terraform script we have written in HCL language for launching ec2 instance 

```
cat  main.tf

provider "aws" {

    region = "us-east-2"  #  THis is aws Ohio region 
    access_key = "AKIAQ4O"
    secret_key = "QF0kNiiTyRiMhmi"
}

#resource "<provider>_<resourcetype>" "anyname" {
    # config options 
    # key 1 = value 1 
  
#}

resource "aws_instance" "firstvm1" {

    ami = "ami-077e31c4939f6a2f3"
    instance_type = "t2.micro"
    key_name = "helloashu"
    tags = {
      "Name" = "Os1"
    }
  
}

```


##   Doing init for the first time in project directory 

### Terraform init will look into all the .tf files and download all the api resources of defined providers 

### in our case we have only aws as provider so it will download only those files

```
fire@XIA:~/Desktop/tech/terraform/project1$ terraform  init 

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/aws...
- Installing hashicorp/aws v3.39.0...
- Installed hashicorp/aws v3.39.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

```

### More closure look 

```
fire@XIA:~/Desktop/tech/terraform/project1$ ls  -a
.  ..  maint.tf  .terraform  .terraform.lock.hcl

```

## Most important thing is to do always a dry-run 

```
ire@XIA:~/Desktop/tech/terraform/project1$ terraform plan 

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.firstvm1 will be created
  + resource "aws_instance" "firstvm1" {
      + ami                                  = "ami-077e31c4939f6a2f3"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + id                   
```

## Now provisioner resources lets do  apply "Terraform apply"

```
fire@XIA:~/Desktop/tech/terraform/project1$ 
fire@XIA:~/Desktop/tech/terraform/project1$ terraform  apply 

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.firstvm1 will be created
  + resource "aws_instance" "firstvm1" {
      + ami                                  = "ami-077e31c4939f6a2f3"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "helloashu"
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "Os1"
        }
      + tags_all                             = {
          + "Name" = "Os1"
        }
      + tenancy                              = (known after apply)
      + vpc_security_group_ids               = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + enclave_options {
          + enabled = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.firstvm1: Creating...
aws_instance.firstvm1: Still creating... [10s elapsed]

```

## Deleting resources 

```
fire@XIA:~/Desktop/tech/terraform/project1$ terraform  destroy 
aws_instance.firstvm1: Refreshing state... [id=i-09b86766f3e3eba46]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_instance.firstvm1 will be destroyed
  - resource "aws_instance" "firstvm1" {
      - ami                                  = "ami-077e31c4939f6a2f3" -> null
      - arn                                  = "arn:aws:ec2:us-east-2:061112302981:instance/i-09b86766f3e3eba46" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "us-east-2c" -> null
      - cpu_core_count                       = 1 -> null
      - cpu_threads_per_core

```

## Note: If we comment a particular section in tf file then we will terraform apply will delete that resources








