data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

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

resource "aws_security_group" "security_group" {
  name        = "${var.project_name} WebDMZ"
  description = "WebDMZ security group for ${var.project_name} view layer"
  vpc_id      = var.vpc_id

  # HTTP
  ingress {
    description = "Allow traffic on port 80 (HTTP) from everywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # HTTPS
  ingress {
    description = "Allow traffic on port 443 (HTTPS) from everywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # SSH
  ingress {
    description = "Allow traffic on port 22 (SSH) from everywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # PING
  ingress {
    description = "Allow ICMP traffic (PING) from everywhere"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${var.project_name} WebDMZ"
    Project = var.project_name
  }
}

resource "aws_instance" "webserver" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.ec2_instance_type
  subnet_id                   = var.subnet_id
  user_data                   = file("${path.module}/init-script.sh")
  vpc_security_group_ids      = [aws_security_group.security_group.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ec2-key-pair.key_name

  tags = {
    Name    = "${var.project_name} WebServer"
    Project = var.project_name
  }
}
