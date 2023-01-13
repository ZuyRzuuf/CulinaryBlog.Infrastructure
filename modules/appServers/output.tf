output "instance_ami" {
  description = "webserver AMI"
  value       = aws_instance.appserver.ami
}

output "instance_id" {
  value = aws_instance.appserver.id
}

output "private_ip" {
  value = aws_instance.appserver.private_ip
}
