variable "project_name" {
  type = string
}

variable "db_engine" {
  description = "DB engine"
  type        = string
}
variable "db_engine_version" {
  description = "DB engine version"
  type        = string
}
variable "db_identifier" {
  description = "DB identifier"
  type        = string
}
variable "db_instance_class" {
  description = "DB server instance class"
  type        = string
}
variable "db_storage_size" {
  description = "DB allocated storage"
  type        = number
}
variable "db_storage_type" {
  description = "DB storage type"
  type        = string
}
variable "db_name" {
  description = "DB name"
  type        = string
}
variable "db_username" {
  description = "DB user username"
  type        = string
}
variable "db_password" {
  description = "DB user password"
  type        = string
}
variable "db_main_private_subnet_id" {
  description = "subnet for DB"
  type        = string
}
variable "db_security_group_id" {
  description = "security group for DB"
  type        = string
}

variable "vpc_id" {
  type = string
}
variable "db_secondary_private_subnet_cidr" {
  type = string
}
variable "region" {
  type = string
}
