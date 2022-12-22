resource "aws_nat_gateway" "nat_gateway" {
  subnet_id     = aws_subnet.public_subnet.id
  allocation_id = aws_eip.elastic_ip.id

  tags = {
    Name    = "${var.project_name} NAT Gateway"
    Project = var.project_name
  }
}

resource "aws_eip" "elastic_ip" {
  vpc = true

  tags = {
    Project = var.project_name
  }
}
