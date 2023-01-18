variable "profile" {
  description = "AWS profile to authenticate"
  type        = string
  default     = "stst-sandbox"
}

variable "environment" {
  description = "working environment"
  type        = string
}

variable "project_name" {
  description = "name of the project"
  type        = string
  default     = "CulinaryBlog"
}
variable "region" {
  description = "AWS Region"
  type        = string
}

variable "ec2_key_pair_path" {
  description = "path to ssh key file"
  type        = string
}
variable "ec2_key_pair_filename" {
  description = "key pair file name for EC2 instances"
  type        = string
}
variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "db_engine" {
  description = "DB engine"
  type        = string
  default     = "mysql"
}
variable "db_engine_version" {
  description = "DB engine version"
  type        = string
  default     = "8.0.28"
}
variable "db_allocation_storage" {
  description = "DB storage size"
  type        = number
}
variable "db_identifier" {
  description = "DB identifier"
  type        = string
}
variable "db_instance_class" {
  description = "DB instance class"
  type        = string
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
  description = "DB user name"
  type        = string
}
variable "db_password" {
  description = "DB password"
  type        = string
}
variable "db_secondary_private_subnet_cidr" {
  description = "CIDR for additional private subnet required by RDS configuration"
  type        = string
  default     = "10.0.4.0/23"
}
