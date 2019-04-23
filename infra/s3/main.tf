provider "aws" {
  region  = var.region
  version = ">= 2.7"
}

resource "aws_s3_bucket" "artifact_bucket" {
  bucket = var.artifact_bucket
  acl    = "private"
}

