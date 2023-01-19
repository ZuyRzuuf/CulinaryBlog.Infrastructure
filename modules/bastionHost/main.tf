data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "bastion_host" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.ec2_instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.web_dmz_security_group_id]
  associate_public_ip_address = true
  key_name                    = var.ec2_ssh_key_pair_name

  tags = {
    Name    = "${var.project_name} BastionHost"
    Project = var.project_name
  }
}
