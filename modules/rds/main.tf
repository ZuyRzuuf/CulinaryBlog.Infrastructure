# Crate a main DB of the project
resource "aws_db_instance" "main_db" {
  identifier             = var.db_identifier
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  allocated_storage      = var.db_storage_size
  storage_type           = var.db_storage_type
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [var.db_security_group_id]
  skip_final_snapshot    = true
  multi_az               = false
  parameter_group_name = "default.mysql8.0"

  tags = {
    Name    = "${var.project_name} Database"
    Project = var.project_name
  }
}
