
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name = "${var.prefix}-vpc"
    ManagedBy = "Terraform"
    Project = var.prefix
    Environment = "Dev"
  }
}


terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}



provider "aws" {
  region = var.region
}
