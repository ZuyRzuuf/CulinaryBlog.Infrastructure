output "instance_id" {
  value = aws_instance.webserver.id
}
output "ip" {
  value = aws_instance.webserver.private_ip
}
