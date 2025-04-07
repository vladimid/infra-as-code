terraform {
  backend "s3" {
    bucket = "vld-iac-lab-tfstate"
    key    = "eu-north-1/vld-iac-lab/terraform.tfstate"
    #    key    = "eu-north-1/backend_support/terraform.tfstate"
    region = "eu-north-1"
    dynamodb_table = "vld-iac-lab-tfstate-locks"
    encrypt        = true
  }
}
