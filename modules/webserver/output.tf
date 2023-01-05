output "instance_ami" {
  description = "webserver AMI"
  value       = aws_instance.webserver.ami
}

output "instance_id" {
  value = aws_instance.webserver.id
}

output "public_ip" {
  value = aws_instance.webserver.public_ip
}
