provider "aws" {

    region = "us-east-2"  #  THis is aws Ohio region 
    access_key = "AKIAQ4OUTXWCUW4RVFPZ"
    secret_key = "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"
}

# a project 
# step 1   create vpc 
# step 2 create Internet gateway
# step 3 create custom route table
# step 4 create subnet
# step 5 associate subnet with route table
# step 6 create security group to allow 22,80 ports
# step 7 create nIC with an ip in the subnet created above
# step 8 EIP will be assigned to NIC
# step 9   create amazon AMI and install apache httpd