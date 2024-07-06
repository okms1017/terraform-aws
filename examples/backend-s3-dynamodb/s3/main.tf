resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name

  tags = {
    Name = "state backend"
  }
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.id

  versioning_configuration {
    status = "Enabled"
  }
}