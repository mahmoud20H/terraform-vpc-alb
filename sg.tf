# Create HTTP Security Group
resource "aws_security_group" "http_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = var.http_ingress_from_port
    to_port     = var.http_ingress_to_port
    protocol    = var.http_ingress_protocol
    cidr_blocks = var.http_ingress_cidr_blocks
  }

  ingress {
    from_port   = var.ssh_ingress_from_port
    to_port     = var.ssh_ingress_to_port
    protocol    = var.ssh_ingress_protocol
    cidr_blocks = var.ssh_ingress_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.http_security_group_name
  }
}

# Create Jumper Security Group
resource "aws_security_group" "jumper_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = var.jumper_ssh_ingress_from_port
    to_port     = var.jumper_ssh_ingress_to_port
    protocol    = var.jumper_ssh_ingress_protocol
    cidr_blocks = var.jumper_ssh_ingress_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.jumper_security_group_name
  }
}
