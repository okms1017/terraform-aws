terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.4.0"
    }
  }

  backend "s3" {
    bucket         = "hello-tf102-remote-backend"
    key            = "terraform/state-test/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-lock"
  }

  required_version = ">= 1.4"
}

provider "aws" {}