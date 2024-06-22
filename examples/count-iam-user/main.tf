provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_iam_user" "iam" {
  count = 3
  name  = "user${count.index}"
}