output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "public_subnet_id" {
  description = "public subnet ID"
  value       = aws_subnet.public_subnet.id
}
