terraform {
  required_version = "~> 1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "serverless_module" {
  bucket_prefix = "serverless-module"
}


resource "aws_s3_bucket_ownership_controls" "serverless_module" {
  bucket = aws_s3_bucket.serverless_module.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}


resource "aws_s3_bucket_acl" "serverless_module" {
  depends_on = [aws_s3_bucket_ownership_controls.serverless_module]

  bucket = aws_s3_bucket.serverless_module.id
  acl    = "public-read"
}

resource "aws_iam_user" "serverless_module" {
  name = "serverless-module-s3-bucket-user"
}

resource "aws_iam_access_key" "serverless_module" {
  user = aws_iam_user.serverless_module.name
}

resource "aws_iam_user_policy" "serverless_module" {
  name = "serverless_module-s3-bucket-user-policy"
  user = aws_iam_user.serverless_module.name

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        Effect : "Allow",
        Action : [
          "s3:ListBucket",
          "s3:GetBucketLocation",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:DeleteObjectVersion",
          "s3:PutObject"
        ]
        Resource = [
          aws_s3_bucket.serverless_module.arn,
          "${aws_s3_bucket.serverless_module.arn}/*",
        ]
      }
    ]
  })
}