d# # cidr_blocks = ["192.168.1.0/25"]
# resource "aws_vpc" "main" {
#   cidr_block           = "192.168.1.0/25"
#   enable_dns_support   = true
#   enable_dns_hostnames = true
#   instance_tenancy     = "default"
#   tags = {
#     Name = "iac-lab-vld"
#   }
# }

# provider "aws" {
#   region = "eu-central-1"
# }

# terraform {
#   required_providers {
#     aws = {
#
#       source = "hashicorp/aws"
#     }
#   }
# }

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
    Name = format("%s-%s-private-subnet-2", var.prefix, var.subnet5_cidr)
  }
}

resource "aws_subnet" "subnet_secure_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet6_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = format("%sb", var.region)

  tags = {
    Name = format("%s-%s-private-subnet-2", var.prefix, var.subnet6_cidr)
  }
}

#
# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.vpc.id
#
#   tags = {
#     Name = format("%s-%s-igw", var.prefix, vld.this.id)
#   }
# }
#
#
# resource "aws_eip" "nat" {
#   domain = "vpc"
# }
#
#
# resource "aws_nat_gateway" "nat" {
#   allocation_id = aws_eip.nat.id
#   subnet_id     = aws_subnet.subnet_public_1.id
#
#   tags = {
#     Name = format("%s-%s-nat", var.prefix, vld.this.id)
#   }
# }
#
#
# resource "aws_route_table" "public_routetable" {
#   vpc_id = aws_vpc.vpc.id
#
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }
#
#   tags = {
#     Name = format("%s-%s-public-route-table", var.prefix, vld.this.id)
#   }
# }
#
# resource "aws_route_table" "private_routetable" {
#   vpc_id = aws_vpc.vpc.id
#
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.nat.id
#   }
#
#   tags = {
#     Name = format("%s-%s-private-route-table", var.prefix, vld.this.id)
#   }
# }
#
#
# resource "aws_route_table_association" "public_subnet_1" {
#   subnet_id      = aws_subnet.subnet_public_1.id
#   route_table_id = aws_route_table.public_routetable.id
# }
#
#
# resource "aws_route_table_association" "public_subnet_2" {
#   subnet_id      = aws_subnet.subnet_public_2.id
#   route_table_id = aws_route_table.public_routetable.id
# }
#
#
# resource "aws_route_table_association" "private_subnet_1" {
#   subnet_id      = aws_subnet.subnet_private_1.id
#   route_table_id = aws_route_table.private_routetable.id
# }
#
#
# resource "aws_route_table_association" "private_subnet_2" {
#   subnet_id      = aws_subnet.subnet_private_2.id
#   route_table_id = aws_route_table.private_routetable.id
# }
