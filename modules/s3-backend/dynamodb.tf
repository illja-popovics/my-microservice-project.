resource "aws_dynamodb_table" "tf_locks" {
  name           = "lesson7-terraform-locks"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
