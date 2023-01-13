# Create public security group
resource "aws_security_group" "security_group_internal_dmz" {
  name        = "${var.project_name} InternalDMZ"
  description = "InternalDMZ security group for ${var.project_name} application layer"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name    = "${var.project_name} InternalDMZ"
    Project = var.project_name
  }
}

resource "aws_security_group_rule" "http_internal_dmz" {
  type              = "ingress"
  description       = "Allow traffic on port 80 (HTTP) from Public Subnet"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [aws_subnet.public_subnet.cidr_block]
  security_group_id = aws_security_group.security_group_internal_dmz.id
}

resource "aws_security_group_rule" "https_internal_dmz" {
  type              = "ingress"
  description       = "Allow traffic on port 443 (HTTPS) from everywhere"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [aws_subnet.public_subnet.cidr_block]
  security_group_id = aws_security_group.security_group_internal_dmz.id
}

resource "aws_security_group_rule" "ssh_internal_dmz" {
  type              = "ingress"
  description       = "Allow traffic on port 22 (SSH) from everywhere"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [aws_subnet.public_subnet.cidr_block]
  security_group_id = aws_security_group.security_group_internal_dmz.id
}

resource "aws_security_group_rule" "ping_internal_dmz" {
  type              = "ingress"
  description       = "Allow ICMP traffic (PING) from everywhere"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = [aws_subnet.public_subnet.cidr_block]
  security_group_id = aws_security_group.security_group_internal_dmz.id
}

resource "aws_security_group_rule" "allow_all_outbound_internal_dmz" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.security_group_internal_dmz.id
}
