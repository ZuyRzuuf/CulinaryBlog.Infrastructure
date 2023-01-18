resource "aws_db_parameter_group" "default" {
  name        = "${var.db_identifier}-param-group"
  description = "Terraform example parameter group for MySQL 8.0"
  family      = "mysql8.0"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }
  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}
