variable "project_name" {
  description = "name of the project derived from globals"
  type        = string
}

variable "region" {
  description = "infrastructure region"
  type        = string
}

variable "environment" {
  description = "environment"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "public subnet ID"
  type        = string
}

variable "ec2_key_pair" {
  description = "key pair for EC2 instances"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
