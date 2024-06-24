resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "terraform VPC"
  }
}

resource "aws_subnet" "main" {
  count             = length(var.subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnets[count.index].subnet_cidr
  availability_zone = var.subnets[count.index].subnet_az

  tags = var.subnets[count.index].subnet_tag
}

output "myvpc_id" {
  value = aws_vpc.main.id
}