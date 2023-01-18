resource "aws_db_subnet_group" "db_subnet" {
  name       = "${lower(var.project_name)}_db_subnet_group"
  subnet_ids = [var.db_main_private_subnet_id, aws_subnet.rds_secondary_subnet.id]
}
