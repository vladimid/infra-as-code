
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"
  tags = {
    # Name = format("%s-%s-vpc", var.prefix, vld.this.id)
    Name = format("%s-%s-vpc", var.prefix, var.vpc_cidr)
  }
}


resource "aws_subnet" "subnet_public_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet1_cidr
  map_public_ip_on_launch = "true"
  availability_zone = format("%sa", var.region)

  tags = {
    Name = format("%s-%s-public-subnet-1", var.prefix, var.subnet1_cidr)
  }
}


resource "aws_subnet" "subnet_public_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet2_cidr
  map_public_ip_on_launch = "true"
  availability_zone = format("%sb", var.region)

  tags = {
    Name = format("%s-%s-public-subnet-2", var.prefix, var.subnet2_cidr)
  }
}


resource "aws_subnet" "subnet_private_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet3_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = format("%sa", var.region)

  tags = {
    Name = format("%s-%s-private-subnet-1", var.prefix, var.subnet3_cidr)
  }
}


resource "aws_subnet" "subnet_private_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet4_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = format("%sb", var.region)

  tags = {
    Name = format("%s-%s-private-subnet-2", var.prefix, var.subnet4_cidr)
  }
}

resource "aws_subnet" "subnet_secure_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet5_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = format("%sb", var.region)

  tags = {
    Name = format("%s-%s-secure-subnet-2", var.prefix, var.subnet5_cidr)
  }
}

resource "aws_subnet" "subnet_secure_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet6_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = format("%sb", var.region)

  tags = {
    Name = format("%s-%s-secure-subnet-2", var.prefix, var.subnet6_cidr)
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id                  = aws_vpc.vpc.id
  tags = {
    Name = format("%s-%s-internet-gateway", var.prefix, var.subnet6_cidr)
  }
}

resource "aws_eip" "elastic-ip" {
  domain   = "vpc"
  tags = {
    Name = format("%s-%s-elastic-ip", var.prefix, var.subnet6_cidr)
  }
}

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.elastic-ip.id
  subnet_id     = aws_subnet.subnet_private_2.id
  tags = {
    Name = "nat-gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_eip.elastic-ip]
}