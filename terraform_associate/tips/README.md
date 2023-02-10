## We can generate graph of terraform plan / code using graphivz 

### make sure you have graphviz installed your terraform machine 

### How to generate 

```
fire@ashutoshhs-MacBook-Air terraform % terraform graph | dot -Tsvg  >graph.svg
```

### graph explanation 

<img src=../images/graph.png>


### terraform Best practises link by Terraform 

[click_here](https://www.terraform-best-practices.com/)

### Terraform format -- TO fix identations automatically 

```
terraform fmt
```

### terraform validate -- To let you know what is missing 

```
terraform validate
```

### listing providers that you are using 

```
fire@ashutoshhs-MacBook-Air devops_terraform % terraform providers

Providers required by configuration:
.
└── provider[registry.terraform.io/hashicorp/aws]

```

## Terraform override files 

### main.tf 

```
resource "aws_instance" "ashu-obj" {
  ami                    = "ami-01a4f99c4ac11b03c"
  instance_type          = "t2.micro"
  key_name               = "hellokey" # using existing key 
  vpc_security_group_ids = [data.aws_security_group.ashu-sg.id, data.aws_security_group.ashu-sg1.id]
  tags = {
    "Name" = "linux-vm-terraform"
  }


}
```

### override.tf -- this will override details :--- only filename must be override.tf 

```
resource "aws_instance" "ashu-obj" {
  
  tags = {
    "Name" = "linux-vm-using-tfoverride"
  }


}
```



https://user-images.githubusercontent.com/8552914/216512889-b6d958c6-bb85-4e1e-bac6-a753757c6869.mp4



