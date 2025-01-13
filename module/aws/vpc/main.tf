# VPC
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"

    tags = {
        Name = var.vpc_name
    }
}

# SUBNET
 resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc.id

    count = length(var.routable_cidr)
    cidr_block = var.routable_cidr[count.index]
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.az.names[count.index]

    tags = {
        Name = var.public_subnet_names[count.index]
    }
 }

 # IGW
 resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        Name = var.igw_name
    }
 }

 # ROUTE TABLE
 resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = var.rt_cidr
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = var.rt_name
    }
 }

 # ROUTE TABLE ASSOCIATION
 resource "aws_route_table_association" "rt_association" {
    count = length(var.routable_cidr)
    subnet_id = aws_subnet.public_subnet[count.index].id
    route_table_id = aws_route_table.rt.id
 }