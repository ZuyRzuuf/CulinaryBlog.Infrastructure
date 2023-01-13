variable "project_name" {
  description = "name of the project derived from globals"
  type        = string
}

variable "region" {
  description = "infrastructure region"
}

variable "environment" {
  description = "environment"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for Public Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "CIDR block for Private Subnet"
  type        = string
  default     = "10.0.2.0/23"
}
