variable "vpc_cidr" {
  type = string
}

variable "subnets" {
  type = list(object({
    subnet_cidr = string,
    subnet_az   = string,
    subnet_tag  = map(string)
  }))
}