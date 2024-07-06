provider "aws" {
  region = "ap-northeast-2"
  alias  = "primary_region"
}

provider "aws" {
  region = "ap-southeast-1"
  alias  = "secondary_region"
}

resource "aws_s3_bucket" "seoul_bucket" {
  provider = aws.primary_region

  bucket = "seoul-region-bucket"
}

resource "aws_s3_bucket" "singapore_bucket" {
  provider = aws.secondary_region

  bucket = "singapore-region-bucket666"
}