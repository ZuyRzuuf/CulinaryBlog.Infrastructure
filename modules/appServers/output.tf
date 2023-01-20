output "instance_id" {
  value = aws_instance.appserver.id
}
output "ip" {
  value = aws_instance.appserver.private_ip
}
