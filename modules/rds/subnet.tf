resource "aws_subnet" "rds_secondary_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.db_secondary_private_subnet_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name = "${var.project_name} RDS secondary subnet"
  }
}
