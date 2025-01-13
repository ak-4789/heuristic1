variable "vpc_cidr" {
    description = "vpc cidr range"
    type = string
    # default = "X"
}

variable "vpc_name" {
    description = "vpc name"
    type = string
    default = "dev_vpc"
}

variable "routable_cidr" {
    description = "public subnet cidr range"
    type = list(string)
    # default = ["X1","X2"]
}

variable "public_subnet_names" {
    description = "public subnet names"
    type = list(string)
    default = ["publicDevSubnet1","publicDevSubnet2"]
}

variable "non_routable_cidr" {
    description = "private subnet cidr range"
    type = list(string)
}

variable "private_subnet_names" {
    description = "private subnet names"
    type = list(string)
    default = ["privateDevSubnet1","privateDevSubnet2"]
}

variable "igw_name" {
    description = "igw name"
    type = string
    default = "dev_igw"
}

variable "rt_cidr" {
    description = "route table cidr range"
    type = string
}

variable "rt_name" {
    description = "route table name"
    type = string
    default = "dev_rt"
}