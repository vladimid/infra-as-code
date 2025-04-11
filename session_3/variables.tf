
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


variable "subnets" {
  type        = list(any)
  description = "Public subnets"
}
