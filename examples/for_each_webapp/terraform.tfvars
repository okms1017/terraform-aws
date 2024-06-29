project = {
  dev-webapp = {
    vpc_cidr_block = "192.168.0.0/16"
    public_subnet_cidr_blocks = ["192.168.1.0/24","192.168.2.0/24","192.168.3.0/24","192.168.4.0/24"]
    private_subnet_cidr_blocks = ["192.168.101.0/24","192.168.102.0/24","192.168.103.0/24","192.168.104.0/24"]
    public_subnets_per_vpc  = 1,
    private_subnets_per_vpc = 1,
    instances_per_subnet    = 1,
    instance_type           = "c4.large",
    environment             = "dev"
  },
  stg-webapp = {
    vpc_cidr_block = "10.10.0.0/16"
    public_subnet_cidr_blocks = ["10.10.1.0/24","10.10.2.0/24","10.10.3.0/24","10.10.4.0/24"]
    private_subnet_cidr_blocks = ["10.10.101.0/24","10.10.102.0/24","10.10.103.0/24","10.10.104.0/24"]
    public_subnets_per_vpc  = 1,
    private_subnets_per_vpc = 1,
    instances_per_subnet    = 1,
    instance_type           = "t3.medium",
    environment             = "stg"
  }
}