resource "aws_s3_bucket" "tf_state" {
  bucket = "lesson7-terraform-state-yourname"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
