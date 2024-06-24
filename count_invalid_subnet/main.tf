
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "terraform VPC"
  }
}

resource "aws_subnet" "main" {
  count = length(var.subnets)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnets[count.index].cidr
  availability_zone = var.subnets[count.index].az

  tags = var.subnets[count.index].tags
}

resource "aws_instance" "server" {
  ami           = "ami-0e8bd0820b6e1360b"
  instance_type = "t4g.nano"
  subnet_id     = aws_subnet.main[1].id
  # index 접근 방법 오류 해결 코드
  # subnet_id = index(aws_subnet.main.*.cidr_block, "192.168.2.0/24")
  tags = {
    Name = "Terraform demo"
  }
}

output "myvpc_id" {
  value = aws_vpc.main.id
}