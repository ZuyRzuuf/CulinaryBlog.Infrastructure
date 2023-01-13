output "project_name" {
  description = "Project name"
  value       = var.project_name
}
output "environment" {
  description = "Environment"
  value       = var.environment
}
output "public_ssh_key_filename" {
  description = "public SSH key filename"
  value       = var.ec2_key_pair_filename
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
output "webserver_public_ip" {
  value = module.webserver.public_ip
}
output "appserver_private_ip" {
  value = module.app_servers.private_ip
}
