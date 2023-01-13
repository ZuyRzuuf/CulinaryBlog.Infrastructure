# Create public security group
resource "aws_security_group" "security_group_webdmz" {
  name        = "${var.project_name} WebDMZ"
  description = "WebDMZ security group for ${var.project_name} view layer"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name    = "${var.project_name} WebDMZ"
    Project = var.project_name
  }
}

resource "aws_security_group_rule" "http" {
  type              = "ingress"
  description       = "Allow traffic on port 80 (HTTP) from everywhere"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.security_group_webdmz.id
}

resource "aws_security_group_rule" "https" {
  type              = "ingress"
  description       = "Allow traffic on port 443 (HTTPS) from everywhere"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.security_group_webdmz.id
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  description       = "Allow traffic on port 22 (SSH) from everywhere"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.security_group_webdmz.id
}

resource "aws_security_group_rule" "ping" {
  type              = "ingress"
  description       = "Allow ICMP traffic (PING) from everywhere"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.security_group_webdmz.id
}

resource "aws_security_group_rule" "allow_all_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.security_group_webdmz.id
}
