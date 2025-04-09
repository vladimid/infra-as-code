

variable "prefix" {
  type        = string
  description = "Prefix"
}

variable "region" {
  type        = string
  description = "Region"
}


variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}


variable "subnet_cidr" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"

  default = ["subnet_cidr1", "subnet_cidr2"]
  # default = ["subnet1_cidr", "subnet2_cidr", "subnet3_cidr", "subnet4_cidr", "subnet5_cidr", "subnet6_cidr"]
}


variable "subnets" {
  default = [
    # {
    #   name          = "public-subnet-01"
    #   cidr_block    = "192.168.1.0/28"
    #   map_public_ip = true
    # },
    # {
    #   name          = "public-subnet-02"
    #   cidr_block    = "192.168.1.16/28"
    #   map_public_ip = true
    # },
    # {
    #   name          = "private-subnet-01"
    #   cidr_block    = "192.168.1.32/28"
    #   map_public_ip = false
    # },
    # {
    #   name          = "private-subnet-02"
    #   cidr_block    = "192.168.1.48/28"
    #   map_public_ip = false
    # },
    {
      name          = "secure-subnet-01"
      cidr_block    = "192.168.1.64/28"
      map_public_ip = false
    },
    {
      name          = "secure-subnet-02"
      cidr_block    = "192.168.1.80/28"
      map_public_ip = false
    }
  ]
}



variable "public_subnets" {
  default = [
    {
      name          = "public-subnet-01"
      cidr_block    = "192.168.1.0/28"
      map_public_ip = true
    },
    {
      name          = "public-subnet-02"
      cidr_block    = "192.168.1.16/28"
      map_public_ip = true
    }
  ]
}

variable "private_subnets" {
  default = [
    {
      name          = "private-subnet-01"
      cidr_block    = "192.168.1.32/28"
      map_public_ip = false
    },
    {
      name          = "private-subnet-02"
      cidr_block    = "192.168.1.48/28"
      map_public_ip = false
    }
  ]
}


variable "subnet_cidrs" {
    type        = map(string)
    description = "Map of CIDR blocks for subnets"

    default = {
      subnet1 = "subnet_cidr1"
      subnet2 = "subnet_cidr2"
      subnet3 = "subnet_cidr3"
      subnet4 = "subnet_cidr4"
      subnet5 = "subnet_cidr5"
      subnet6 = "subnet_cidr6"
    }
    # default = ["subnet3_cidr", "subnet4_cidr", "subnet5_cidr", "subnet6_cidr"]
}

variable "public_ip_address" {
    type        = string
    description = "Public IP address"
}