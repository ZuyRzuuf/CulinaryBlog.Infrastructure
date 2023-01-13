output "key_name" {
  description = "key name for EC2 instances"
  value       = aws_key_pair.ssh_key.key_name
}
