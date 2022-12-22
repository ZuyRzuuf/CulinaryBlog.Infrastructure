# Create public security group
resource "aws_security_group" "security_group" {
  name        = "${var.project_name} WebDMZ"
  description = "WebDMZ security group for ${var.project_name} view layer"
  vpc_id      = aws_vpc.vpc.id

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
