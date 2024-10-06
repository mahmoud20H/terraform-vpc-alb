# create jump server

resource "aws_instance" "my_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_1_cidr          # Using variable for public subnet 1
  vpc_security_group_ids      = [aws_security_group.jumper_sg.id] # Attach jumper security group
  associate_public_ip_address = true
  availability_zone           = var.subnet_1_az # us-east-1a
  tags = {
    Name = var.instance_name
  }
}

