resource "aws_vpc" "vpc_dev" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "vpc-dev"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc_dev.id
  cidr_block = "${var.public_subnet}"

  tags = {
    Name = "public-subnet-dev"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.vpc_dev.id
  cidr_block = "${var.private_subnet}"

  tags = {
    Name = "private-subnet-dev"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_dev.id

  tags = {
    Name = "IG-dev"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc_dev.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-rt-dev"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

