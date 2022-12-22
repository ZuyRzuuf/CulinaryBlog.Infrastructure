output "instance_ami" {
  description = "webserver AMI"
  value       = aws_instance.webserver.ami
}

output "instance_id" {
  value = aws_instance.webserver.id
}
