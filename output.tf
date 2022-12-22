output "project_name" {
  description = "Project name"
  value       = var.project_name
}
output "environment" {
  description = "Environment"
  value       = var.environment
}
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}
output "webserver_ami" {
  description = "webserver AMI"
  value       = module.webserver.instance_ami
}
output "webserver_id" {
  description = "webserver ID"
  value       = module.webserver.instance_id
}
