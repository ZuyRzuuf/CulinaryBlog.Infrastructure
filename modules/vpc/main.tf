# Crate a AWS VPC which contains the following
#   - VPC
#   - Public subnet
#   - Private subnet
#   - Internet Gateway
#   - Public routing table associated with Internet Gateway
#   - NAT Gateway in public subnet
#   - Default (private) route table associated with NAT Gateway
#   - Security groups

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name    = "${var.project_name} VPC"
    Project = var.project_name
  }
}
