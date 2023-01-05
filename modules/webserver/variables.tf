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

variable "web_dmz_security_group_id" {
  description = "WebDMZ security group ID"
  type        = string
}

variable "ec2_key_pair_path" {
  description = "path to ssh key file"
  type        = string
}

variable "ec2_key_pair_filename" {
  description = "key pair name for EC2 instances"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
