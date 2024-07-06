resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "terraform-lock" # table이름
  hash_key     = "LockID"         # key 이름
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S" # key 타입
  }
}