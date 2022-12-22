locals {
  key_pair_name = "${var.project_name}_${var.environment}"
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "ec2-key-pair" {
  key_name   = local.key_pair_name
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "local_file" "tf-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = aws_key_pair.ec2-key-pair.key_name
}
