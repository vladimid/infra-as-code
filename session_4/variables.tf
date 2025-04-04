
# prefix = "session2"


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
  description = "vpc_cidr"
}


variable "subnet1_cidr" {
  type        = string
  description = "subnet1_cidr"
}


# variable "subnet2_cidr" {
#   type        = string
#   description = "subnet2_cidr"
# }
#
#
# variable "subnet3_cidr" {
#   type        = string
#   description = "subnet3_cidr"
# }
#
#
# variable "subnet4_cidr" {
#   type        = string
#   description = "subnet4_cidr"
# }
#
#
# variable "subnet5_cidr" {
#   type        = string
#   description = "subnet5_cidr"
# }
#
#
# variable "subnet6_cidr" {
#   type        = string
#   description = "subnet6_cidr"
# }
#
# variables "subnet_names" {
#   description = "subnet_names"
#   type        = list(string)
#   default     = ["subnet1_cidr", "subnet2_cidr", "subnet3_cidr", "subnet4_cidr", "subnet5_cidr", "subnet6_cidr"]
#
# }

variable "subnet_names" {
  description = "subnet_names"
  type        = list(string)
  default     = ["subnet1_cidr", "subnet2_cidr", "subnet3_cidr", "subnet4_cidr", "subnet5_cidr", "subnet6_cidr"]
}
