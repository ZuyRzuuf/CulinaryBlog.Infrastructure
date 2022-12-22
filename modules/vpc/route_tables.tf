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
