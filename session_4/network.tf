
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


resource "aws_subnet" "subnets" {
  for_each = tomap({
    for subnet in var.subnets : subnet.name => subnet
  })

  tags = {
    Name = format("%s-%s-%s", var.prefix, var.region, each.key)
  }

  vpc_id = aws_vpc.vpc.id
  cidr_block = each.value.cidr_block
}


resource "aws_internet_gateway" "internet-gateway" {
  vpc_id                  = aws_vpc.vpc.id
  tags = {
    Name = format("%s-internet-gateway", var.prefix)
  }
}

resource "aws_eip" "elastic-ip" {
  domain   = "vpc"
  tags = {
    Name = format("%s-elastic-ip", var.prefix)
  }
}
#
# resource "aws_nat_gateway" "nat-gateway" {
#   allocation_id = aws_eip.elastic-ip.id
#   subnet_id     = aws_subnet.private_subnet_2.id
#   tags = {
#     Name = format("%s-nat-gateway", var.prefix)
#   }
#
#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_eip.elastic-ip]
# }


resource "aws_route_table" "public-route-table" {
  vpc_id                  = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = format("%s-route-table", var.prefix)
  }
}

# resource "aws_route_table" "private-route-table" {
#   vpc_id                  = aws_vpc.vpc.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.nat-gateway.id
#   }
#
#   tags = {
#     Name = format("%s-route-table", var.prefix)
#   }
# }
#
#
# resource "aws_route_table_association" "public_subnet_1" {
#   subnet_id      = aws_subnet.public_subnet_1.id
#   route_table_id = aws_route_table.public-route-table.id
# }
#
# resource "aws_route_table_association" "public_subnet_2" {
#   subnet_id      = aws_subnet.public_subnet_2.id
#   route_table_id = aws_route_table.public-route-table.id
# }
#
# resource "aws_route_table_association" "private_subnet_1" {
#   subnet_id      = aws_subnet.private_subnet_1.id
#   route_table_id = aws_route_table.private-route-table.id
# }
#
# resource "aws_route_table_association" "private_subnet_2" {
#   subnet_id      = aws_subnet.private_subnet_2.id
#   route_table_id = aws_route_table.private-route-table.id
# }
