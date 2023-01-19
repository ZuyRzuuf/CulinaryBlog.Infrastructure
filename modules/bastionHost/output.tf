output "instance_ami" {
  description = "Bastion Host AMI"
  value       = aws_instance.bastion_host.ami
}
output "instance_id" {
  description = "Bastion Host instance ID"
  value       = aws_instance.bastion_host.id
}
output "public_ip" {
  description = "Bastion Host public IPv4"
  value       = aws_instance.bastion_host.public_ip
}
