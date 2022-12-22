variable "profile" {
  description = "AWS profile to authenticate"
  type        = string
  default     = "stst-sandbox"
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

variable "environment" {
  description = "working environment"
  type        = string
}

variable "ec2_key_pair" {
  description = "key pair for EC2 instances"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
}
