
terraform {
  backend "s3" {
    bucket = "vld-iac-lab-tfstate"
    key    = "terraform.tfstate"
    region = "eu-north-1"

    dynamodb_table = "vld-iac-lab-dynamodb_table"
    encrypt        = true
  }
}