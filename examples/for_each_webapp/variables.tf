variable "aws_region" {
  type    = string
  default = "ap-northeast-2"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC."
  type        = string
  default     = "192.168.0.0/16"
}

variable "project" {
  description = "Map of project names to configuration."
  type = map(object({
    vpc_cidr_block             = string
    public_subnet_cidr_blocks  = list(string)
    private_subnet_cidr_blocks = list(string)
    public_subnets_per_vpc     = number
    private_subnets_per_vpc    = number
    instances_per_subnet       = number
    instance_type              = string
    environment                = string
  }))
}
