output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "public_subnet_id" {
  description = "public subnet ID"
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "private subnet ID"
  value       = aws_subnet.private_subnet.id
}

output "web_dmz_security_group_id" {
  description = "WebDMZ security group ID"
  value       = aws_security_group.security_group_webdmz.id
}

output "internal_dmz_security_group_id" {
  description = "InternalDMZ security group ID"
  value       = aws_security_group.security_group_internal_dmz.id
}
