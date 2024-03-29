# IaaC for Culinary Blog

## Files structure
### provider.tf
File contains information necessary to authorize to AWS.
### versions.tf
File is working with [tfswitch](https://github.com/warrensbox/terraform-switcher).
is responsible for switching terraform to the version required by the script.
### variables.tf
File contains global variables with default values used by the script.
### terraform.tfvars
File contains values for global variables.
### *.tfvars
Files contain global variables values for the particular environment.
### main.tf
File collects modules used for building infrastructure.
### output.tf
File contains information to display after infrastructure is provisioned.
### modules
Folder contains modules. Every module is stored in separate subfolder named from module name.
Every module subfolder contains file `main.tf` with module definition, file `variables.tf`
that contains variables specific for this module and file `output.tf` which contains informations returned from the module.

## Infrastructure modules 
### VPC
#### Steps
1. Creating a VPC with CIDR Block and enable DNS Hostnames to assign DNS names to instances.
2. Creating subnets 
   - public
   - private
3. Creating an internet gateway for connecting VPC/Network with the internet and also attach gateway to VPC.
4. Creating a route table and create route for internet gateway so that instance can connect to the internet
5. Associate public subnet with newly created route table.
6. Creating an Elastic IP for the NAT Gateway.
7. Creating a NAT gateway and allocate the elastic IP to it and put it in public subnet.
8. Adding route to NAT gateway to the default (private) route table created along VPC to let resources from private subnet access to the internet.
9. Creating WebDMZ security group allowing communication from / to the internet

### Key Pair
#### Steps
1. Creating Key Pair for EC2 instance

### WebServer
1. Creating EC2 instance, attach it to the public security group in the public subnet

### Application servers
#### Steps
1. Creating two EC2 instance, attach it to the private security group in the private subnet
