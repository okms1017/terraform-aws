variable "vpc_cidr" {
  type = string
}

variable "subnets" {
  type = list(object({
    cidr = string
    az   = string
    tags = map(string)
  }))
}