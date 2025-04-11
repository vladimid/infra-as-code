resource "aws_ecr_repository" "api" {
  name                 = lower("${var.prefix}-crud-app")
  force_delete         = true
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = lower("${var.prefix}-crud-app")
    ManagedBy   = "Terraform"
    Project     = var.prefix
    Environment = "Dev"
  }
}