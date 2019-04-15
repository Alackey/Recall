provider "aws" {
  region = "${var.region}"
}

############################################
# IAM - Role & Permissions for our lambda
############################################

resource "aws_iam_role" "lambda_role" {
  name = "recall_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "recall_lambda_policy"
  role = "${aws_iam_role.lambda_role.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
          "Effect": "Allow",
          "Action": "s3:*",
          "Resource": "*"
        }
    ]
}
EOF
}

############################################
# LAMBDA - Create the lambda function
############################################

resource "aws_lambda_function" "recall_api" {
  function_name = "recall-api"

  # fetch the artifact from bucket created earlier
  s3_bucket = "${var.artifact_bucket}"
  s3_key    = "${var.artifact_zip_name_reminder}"

  source_code_hash = "${filebase64sha256(var.artifact_zip_name_reminder)}"

  handler = "${var.functions_file_name_getReminder}.getReminder_handler"
  runtime = "python3.7"

  role = "${aws_iam_role.lambda_role.arn}"
}
