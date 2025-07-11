resource "aws_s3_bucket" "tf_state" {
  bucket = "lesson7-terraform-state-ilko123"
  acl    = "private"

  versioning {
    enabled = true
  }

}
