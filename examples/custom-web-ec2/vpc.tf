provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_vpc" "seong_vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "seong-vpc"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "seong_subnet1" {
  vpc_id     = aws_vpc.seong_vpc.id
  cidr_block = "10.10.1.0/24"

  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "seong-subnet1"
  }
}

resource "aws_subnet" "seong_subnet2" {
  vpc_id     = aws_vpc.seong_vpc.id
  cidr_block = "10.10.2.0/24"

  availability_zone = data.aws_availability_zones.available.names[2]

  tags = {
    Name = "seong-subnet2"
  }
}

resource "aws_internet_gateway" "seong_igw" {
  vpc_id = aws_vpc.seong_vpc.id

  tags = {
    Name = "seong-igw"
  }
}

resource "aws_route_table" "seong_rt" {
  vpc_id = aws_vpc.seong_vpc.id

  tags = {
    Name = "seong-rt"
  }
}

resource "aws_route_table_association" "seong_rt_association1" {
  subnet_id      = aws_subnet.seong_subnet1.id
  route_table_id = aws_route_table.seong_rt.id
}

resource "aws_route_table_association" "seong_rt_association2" {
  subnet_id      = aws_subnet.seong_subnet2.id
  route_table_id = aws_route_table.seong_rt.id
}

resource "aws_route" "seong_default_route" {
  route_table_id         = aws_route_table.seong_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.seong_igw.id
}


output "aws_vpc_id" {
  value = aws_vpc.seong_vpc.id
}