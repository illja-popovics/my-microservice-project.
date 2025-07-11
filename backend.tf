# terraform {
#   backend "s3" {
#     bucket         = "lesson7-terraform-state-ilko123"
#     key            = "terraform.tfstate"
#     region         = "eu-north-1"
#     dynamodb_table = "lesson7-terraform-locks"
#     encrypt        = true
#   }
# }
