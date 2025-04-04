# Goal 1 Task 2: Create an S3 Bucket
resource "aws_s3_bucket" "vld-s3-bucket" {
  bucket = "${var.prefix}-tfstate"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "vld-s3-bucket-versioning" {
  bucket = aws_s3_bucket.vld-s3-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "vld-server-side-encryption-configuration" {
  bucket = aws_s3_bucket.vld-s3-bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


resource "aws_s3_bucket_public_access_block" "vld_s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.vld-s3-bucket.id
}
