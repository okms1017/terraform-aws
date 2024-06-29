project = {
  dev-webapp = {
    public_subnets_per_vpc  = 1,
    private_subnets_per_vpc = 1,
    instances_per_subnet    = 1,
    instance_type           = "c4.large",
    environment             = "dev"
  },
  test-webapp = {
    public_subnets_per_vpc  = 1,
    private_subnets_per_vpc = 1,
    instances_per_subnet    = 1,
    instance_type           = "t3.medium",
    environment             = "test"
  }
}