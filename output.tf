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

output "bastion_host_id" {
  description = "Bastion Host ID"
  value       = module.webserver.instance_id
}
output "bastion_host_ip" {
  description = "Bastion Host public IPv4"
  value       = module.bastion_host.public_ip
}

output "webserver_id" {
  description = "webserver ID"
  value       = module.webserver.instance_id
}
output "webserver_ip" {
  value = module.webserver.ip
}

output "appserver_id" {
  description = "appserver ID"
  value       = module.app_servers.instance_id
}
output "appserver_ip" {
  value = module.app_servers.ip
}

output "database_id" {
  value = module.database.database_id
}
