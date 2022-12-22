# Crate a AWS VPC which contains the following
#   - VPC
#   - Public subnet
#   - Private subnet
#   - Internet Gateway
#   - Public routing table associated with Internet Gateway
#   - NAT Gateway in public subnet
#   - Default (private) route table associated with NAT Gateway

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name    = "${var.project_name} VPC"
    Project = var.project_name
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "${var.project_name} Public Subnet"
    Project = var.project_name
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = "${var.region}a"

  tags = {
    Name    = "${var.project_name} Private Subnet"
    Project = var.project_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name    = "${var.project_name} Internet Gateway"
    Project = var.project_name
  }
}

resource "aws_route_table" "public_routes_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name    = "${var.project_name} Public Route Table"
    Project = var.project_name
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  route_table_id = aws_route_table.public_routes_table.id
  subnet_id      = aws_subnet.public_subnet.id
}

resource "aws_eip" "elastic_ip" {
  vpc = true

  tags = {
    Project = var.project_name
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  subnet_id     = aws_subnet.public_subnet.id
  allocation_id = aws_eip.elastic_ip.id

  tags = {
    Name    = "${var.project_name} NAT Gateway"
    Project = var.project_name
  }
}

resource "aws_default_route_table" "private_routes_table" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name    = "${var.project_name} Private Route Table"
    Project = var.project_name
  }
}
