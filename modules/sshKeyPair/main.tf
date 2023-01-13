resource "aws_key_pair" "ssh_key" {
  key_name   = "public_ssh_key_name"
  public_key = file("${var.ec2_key_pair_path}/${var.ec2_key_pair_filename}")
}
