provider "aws" {
  region = "${var.region}"
}

resource "aws_s3_bucket" "artifact_bucket" {
  bucket = "${var.artifact_bucket}"
  acl = "private"
}

