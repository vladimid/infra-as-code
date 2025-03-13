

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



data "aws_availability_zones" "available" {

}

resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = aws_vpc.vpc.id
  # cidr_block              = cidrsubnet("192.168.1.0/25",3,1)
  # cidr_block              = cidrsubnet( var.vpc_cidr, 3, data.aws_availability_zones.available.names[count.index])
  cidr_block              = cidrsubnet( var.vpc_cidr, 3, 1 + count.index)
  map_public_ip_on_launch = "true"
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = format("%s-%s-public-subnet", var.prefix, count.index)
  }
}

