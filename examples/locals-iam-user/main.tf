provider "aws" {
  region = "ap-northeast-2"
}

locals {
  name = "user"
  team = {
    group = "devops"
  }
}

resource "aws_iam_user" "iamuser1" {
  name = "${local.name}1"
  tags = local.team
}

resource "aws_iam_user" "iamuser2" {
  name = "${local.name}2"
  tags = local.team
}