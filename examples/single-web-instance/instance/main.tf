
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

        resource "aws_security_group" "sg_22" {
          name   = "sg_22"
          vpc_id = data.aws_vpc.default-vpc.id

          ingress {
            from_port   = 22
            to_port     = 22
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
          }
          egress {
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = ["0.0.0.0/0"]
          }
        }

        resource "aws_security_group" "sg_80" {
          name   = "sg_80"
          vpc_id = data.aws_vpc.default-vpc.id

          ingress {
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
          }
        }

        resource "aws_instance" "web" {
          ami                         = data.aws_ami.ubuntu.id
          instance_type               = "t3.medium"
          subnet_id                   = data.aws_subnet.default-subnet.id
          vpc_security_group_ids      = [aws_security_group.sg_22.id, aws_security_group.sg_80.id]
          associate_public_ip_address = true
          user_data                   = file("../scripts/add-ssh-apache.yaml")

          tags = {
            Name = "Apache-WEB"
          }
        }

        output "public_ip" {
          value = aws_instance.web.public_ip
        }
