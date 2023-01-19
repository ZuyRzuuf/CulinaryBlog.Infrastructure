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

output "bastion_host_ami" {
  description = "Bastion Host AMI"
  value       = module.webserver.instance_ami
}
output "bastion_host_id" {
  description = "Bastion Host ID"
  value       = module.webserver.instance_id
}
output "bastion_host_ip" {
  description = "Bastion Host public IPv4"
  value       = module.webserver.public_ip
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

output "database_id" {
  value = module.database.database_id
}
