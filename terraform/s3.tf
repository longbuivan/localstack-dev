resource "aws_s3_bucket" "s3" {
  bucket = "poc-s3"
  acl = "private"

  versioning {
    enabled = false
  }
  tags = local.tags
}

resource "aws_s3_bucket" "s3_log" {
  bucket = "tf-bucket"
  acl    = "private"

  tags = {
    Name        = "DE"
    Environment = "Dev"
  }
}