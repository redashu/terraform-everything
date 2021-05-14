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


# Creating a small demo project 

## Project details --

<ol>
   <li> create vpc </li>
   <li> create Internet gateway </li>
   <li> create custom route table </li>
   <li> create subnet </li>
   <li> associate subnet with route table </li>
   <li> create security group to allow 22,80 ports </li>
   <li> create nIC with an ip in the subnet created above </li>
   <li> EIP will be assigned to NIC </li>
   <li> create amazon AMI and install apache httpd </li>
</ol>

### deploy 

```

fire@XIA:~/Desktop/tech/terraform/project2$ terraform apply   --auto-approve
aws_vpc.ashuvpc: Refreshing state... [id=vpc-048830d8ad8c4c1ad]
aws_internet_gateway.ashugw: Refreshing state... [id=igw-055faed8c3424e56d]
aws_subnet.public: Refreshing state... [id=subnet-092b69283e966a7ff]
aws_security_group.allow_customport: Refreshing state... [id=sg-03b9f827c441d0f25]
aws_network_interface.ashu-nic: Refreshing state... [id=eni-03dd60480b4f34506]
aws_route_table.ashuroute: Refreshing state... [id=rtb-01e796493d63c0deb]
aws_route_table_association.ashurouteasso: Refreshing state... [id=rtbassoc-0fb2ca02d2574d684]
aws_eip.webEIP: Refreshing state... [id=eipalloc-0c3af7ca62b2adf51]
aws_instance.ashuos1: Creating...
aws_instance.ashuos1: Still creating... [10s elapsed]
aws_instance.ashuos1: Still creating... [20s elapsed]
aws_instance.ashuos1: Still creating... [30s elapsed]
aws_instance.ashuos1: Creation complete after 32s [id=i-00f071ac5564bea58]

```
### Destroy 

```
fire@XIA:~/Desktop/tech/terraform/project2$ terraform  destroy    --auto-approve
aws_vpc.ashuvpc: Refreshing state... [id=vpc-048830d8ad8c4c1ad]
aws_internet_gateway.ashugw: Refreshing state... [id=igw-055faed8c3424e56d]
aws_subnet.public: Refreshing state... [id=subnet-092b69283e966a7ff]
aws_security_group.allow_customport: Refreshing state... [id=sg-03b9f827c441d0f25]
aws_route_table.ashuroute: Refreshing state... [id=rtb-01e796493d63c0deb]
aws_network_interface.ashu-nic: Refreshing state... [id=eni-03dd60480b4f34506]
aws_eip.webEIP: Refreshing state... [id=eipalloc-0c3af7ca62b2adf51]
aws_instance.ashuos1: Refreshing state... [id=i-00f071ac5564bea58]
aws_route_table_association.ashurouteasso: Refreshing state... [id=rtbassoc-0fb2ca02d2574d684]
aws_route_table_association.ashurouteasso: Destroying... [id=rtbassoc-0fb2ca02d2574d684]
aws_eip.webEIP: Destroying... [id=eipalloc-0c3af7ca62b2adf51]
aws_instance.ashuos1: Destroying... [id=i-00f071ac5564bea58]
aws_route_table_association.ashurouteasso: Destruction complete after 1s
aws_route_table.ashuroute: Destroying... [id=rtb-01e796493d63c0deb]
aws_eip.webEIP: Destruction complete after 4s
aws_route_table.ashuroute: Destruction complete after 3s
aws_internet_gateway.ashugw: Destroying... [id=igw-055faed8c3424e56d]
aws_instance.ashuos1: Still destroying... [id=i-00f071ac5564bea58, 10s elapsed]
aws_internet_gateway.ashugw: Still destroying... [id=igw-055faed8c3424e56d, 10s elapsed]
aws_internet_gateway.ashugw: Destruction complete after 12s
aws_instance.ashuos1: Still destroying... [id=i-00f071ac5564bea58, 20s elapsed]
aws_instance.ashuos1: Still destroying... [id=i-00f071ac5564bea58, 30s elapsed]
aws_instance.ashuos1: Still destroying... [id=i-00f071ac5564bea58, 40s elapsed]
aws_instance.ashuos1: Still destroying... [id=i-00f071ac5564bea58, 50s elapsed]
aws_instance.ashuos1: Still destroying... [id=i-00f071ac5564bea58, 1m0s elapsed]
aws_instance.ashuos1: Still destroying... [id=i-00f071ac5564bea58, 1m10s elapsed]
aws_instance.ashuos1: Still destroying... [id=i-00f071ac5564bea58, 1m20s elapsed]
aws_instance.ashuos1: Still destroying... [id=i-00f071ac5564bea58, 1m30s elapsed]
aws_instance.ashuos1: Still destroying... [id=i-00f071ac5564bea58, 1m40s elapsed]
aws_instance.ashuos1: Still destroying... [id=i-00f071ac5564bea58, 1m50s elapsed]
aws_instance.ashuos1: Still destroying... [id=i-00f071ac5564bea58, 2m0s elapsed]
aws_instance.ashuos1: Destruction complete after 2m4s
aws_network_interface.ashu-nic: Destroying... [id=eni-03dd60480b4f34506]
aws_network_interface.ashu-nic: Destruction complete after 3s
aws_subnet.public: Destroying... [id=subnet-092b69283e966a7ff]
aws_security_group.allow_customport: Destroying... [id=sg-03b9f827c441d0f25]
aws_subnet.public: Destruction complete after 2s
aws_security_group.allow_customport: Destruction complete after 2s
aws_vpc.ashuvpc: Destroying... [id=vpc-048830d8ad8c4c1ad]
aws_vpc.ashuvpc: Destruction complete after 2s

Destroy complete! Resources: 9 destroyed.

```

