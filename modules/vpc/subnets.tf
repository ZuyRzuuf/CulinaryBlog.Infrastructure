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

resource "aws_route_table_association" "public_subnet_association" {
  route_table_id = aws_route_table.public_routes_table.id
  subnet_id      = aws_subnet.public_subnet.id
}
