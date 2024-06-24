vpc_cidr = "192.168.0.0/16"

subnets = [
  {
    subnet_cidr = "192.168.1.0/24",
    subnet_az   = "ap-northeast-2a",
    subnet_tag = {
      Name        = "public-subnet"
      Environment = "dev"
    }
  },
  {
    subnet_cidr = "192.168.2.0/24",
    subnet_az   = "ap-northeast-2c",
    subnet_tag = {
      Name        = "private-subnet"
      Environment = "dev"
    }
  }
]
