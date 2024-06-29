variable "aws_region" {
  type    = string
  default = "ap-northeast-2"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC."
  type        = string
  default     = "192.168.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  description = "Available cidr blocks for public subnets."
  type        = list(string)
  default = [
    "192.168.1.0/24",
    "192.168.2.0/24",
    "192.168.3.0/24",
    "192.168.4.0/24",
    "192.168.5.0/24",
    "192.168.6.0/24",
    "192.168.7.0/24",
    "192.168.8.0/24",
    "192.168.9.0/24",
    "192.168.10.0/24",
    "192.168.11.0/24",
    "192.168.12.0/24",
    "192.168.13.0/24",
    "192.168.14.0/24",
    "192.168.15.0/24",
    "192.168.16.0/24"
  ]
}

variable "private_subnet_cidr_blocks" {
  description = "Available cidr blocks for private subnets."
  type        = list(string)
  default = [
    "192.168.101.0/24",
    "192.168.102.0/24",
    "192.168.103.0/24",
    "192.168.104.0/24",
    "192.168.105.0/24",
    "192.168.106.0/24",
    "192.168.107.0/24",
    "192.168.108.0/24",
    "192.168.109.0/24",
    "192.168.110.0/24",
    "192.168.111.0/24",
    "192.168.112.0/24",
    "192.168.113.0/24",
    "192.168.114.0/24",
    "192.168.115.0/24",
    "192.168.116.0/24"
  ]
}

variable "project" {
  description = "Map of project names to configuration."
  type = map(object({
    public_subnets_per_vpc  = number
    private_subnets_per_vpc = number
    instances_per_subnet    = number
    instance_type           = string
    environment             = string
  }))
}
