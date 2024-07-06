terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.4.0"
    }
  }

  backend "s3" {
    bucket         = "seong-remote-backend"
    key            = "terraform/state/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-lock"
  }

  required_version = ">= 1.4"
}

provider "aws" {}