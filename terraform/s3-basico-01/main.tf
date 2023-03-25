# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "aws-icesi-2023"
}

resource "aws_s3_bucket" "bucket-01" {
  bucket = "habr-bucket-202303"

  tags = {
    Name        = "habr-bucket-202303"
    Environment = "qa"
  }
}

resource "aws_s3_bucket_acl" "bucket-01-acl" {
  bucket = aws_s3_bucket.bucket-01.id
  acl    = "private"
}

resource "aws_s3_bucket" "bucket-02" {
  bucket = "s3-website-habr-bucket-202303"
  acl    = "public-read"
  policy = file("policy.json")

  website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }
}