# Create Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  tags = {
    Name = "nat-eip"
  }
}
# Create NAT Gateway using the Elastic IP
resource "aws_nat_gateway" "nat_gateway" {
  subnet_id     = var.public_subnet_2_cidr # Using variable for public subnet 2
  allocation_id = aws_eip.nat_eip.id       # Static Elastic IP
  tags = {
    Name = var.nat_gateway_name # NAT gateway name as a variable
  }
}
# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id # Associate with the VPC
  tags = {
    Name = var.igw_name # IGW name as a variable
  }
}

######## Create Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.public_cidr_block       # Using variable for CIDR block
    gateway_id = aws_internet_gateway.igw.id # Route to the Internet Gateway
  }

  tags = {
    Name = "public-RT"
  }
}

# Create Private Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"                    # Default route for all traffic
    nat_gateway_id = aws_nat_gateway.nat_gateway.id # Route to the NAT Gateway
  }

  tags = {
    Name = "private-RT"
  }
}

# Associate Public Route Table with Public Subnet 1
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = var.public_subnet_1_cidr
  route_table_id = aws_route_table.public_route_table.id
}

# Associate Public Route Table with Public Subnet 2
resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = var.public_subnet_2_cidr
  route_table_id = aws_route_table.public_route_table.id
}

# Associate Private Route Table with Private Subnet 1
resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = var.private_subnet_2_cidr
  route_table_id = aws_route_table.private_route_table.id
}

# Associate Private Route Table with Private Subnet 2
resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = var.private_subnet_2_cidr
  route_table_id = aws_route_table.private_route_table.id
}
