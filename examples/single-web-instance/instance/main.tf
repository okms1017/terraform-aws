
provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_vpc" "default-vpc" {
  filter {
    name   = "tag:Name"
    values = ["default-vpc"]
  }
}

data "aws_subnet" "default-subnet" {
  filter {
    name   = "tag:Name"
    values = ["default-subnet01"]
  }
}

        resource "aws_security_group" "web_sg" {
          name   = "web-sg"
          vpc_id = data.aws_vpc.default-vpc.id
        }

        resource "aws_security_group_rule" "sg_22" {
          type              = "ingress"
          from_port         = 22
          to_port           = 22
          protocol          = "tcp"
          cidr_blocks       = ["0.0.0.0/0"]
          security_group_id = aws_security_group.web_sg.id
        }

        resource "aws_security_group_rule" "sg_80" {
          type              = "ingress"
          from_port         = 80
          to_port           = 80
          protocol          = "tcp"
          cidr_blocks       = ["0.0.0.0/0"]
          security_group_id = aws_security_group.web_sg.id
        }

        resource "aws_security_group_rule" "sg_00" {
          type              = "egress"
          from_port         = 0
          to_port           = 0
          protocol          = "-1"
          cidr_blocks       = ["0.0.0.0/0"]
          security_group_id = aws_security_group.web_sg.id
        }

resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.medium"
  subnet_id                   = data.aws_subnet.default-subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  user_data                   = file("../scripts/add-ssh-apache.yaml")

  tags = {
    Name = "Apache-WEB"
  }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}
