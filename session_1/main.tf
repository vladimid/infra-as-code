# cidr_blocks = ["192.168.1.0/25"]
resource "aws_vpc" "main" {
  cidr_block           = "192.168.1.0/25"
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name = "iac-lab-vld"
  }
}
#
# provider "aws" {
#   region = "eu-north-1"
# }

# terraform {
#   required_providers {
#     aws = {
#
#       source = "hashicorp/aws"
#     }
#   }
# }
