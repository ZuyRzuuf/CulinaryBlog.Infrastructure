data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "public_ssh_key_name"
  public_key = file("${var.ec2_key_pair_path}/${var.ec2_key_pair_filename}")
}

resource "aws_instance" "webserver" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.ec2_instance_type
  subnet_id                   = var.subnet_id
  user_data                   = file("${path.module}/init-script.sh")
  vpc_security_group_ids      = [var.web_dmz_security_group_id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ssh_key.key_name

  tags = {
    Name    = "${var.project_name} WebServer"
    Project = var.project_name
  }
}
