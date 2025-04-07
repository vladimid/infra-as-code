
variable "prefix" {
  type        = string
  description = "prefix"
}

variable "region" {
  type        = string
  description = "region"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "subnet1_cidr" {
  type        = string
  description = "Public subnet 1 CIDR"
}