#
# terraform {
#   backend "s3" {
#     bucket = "vld-iac-demo-tfstate"
#     key    = "eu-north-1/iac-demo/terraform.tfstate"
#     region = "eu-north-1"
#
#     dynamodb_table = "vld-iac-demo-tfstate-locks"
#     encrypt = true
#   }
# }
