
resource "aws_s3_bucket" "vld_s3_bucket" {
  bucket = "${var.prefix}-tfstate"
  force_destroy = true

}

resource "aws_s3_bucket_versioning" "vld_s3_bucket_versioning" {
  bucket = aws_s3_bucket.vld_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_encryption_configuration" "example" {
  provider = aws.regional
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "vld_s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.vld_s3_bucket.id
}


