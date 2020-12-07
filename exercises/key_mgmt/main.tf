terraform {
  required_version = ">= 0.14"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

# AWS Provider
provider "aws" {
  region = var.aws-primary
}

# Lambda function greetings
resource "aws_lambda_function" "kms_with_lambda" {
  filename      = data.archive_file.lambda_function.output_path
  function_name = var.saa_lambda_function.name
  role          = var.precreated_lambda_role.arn
  handler       = "${var.saa_lambda_function.file}.lambda_handler"
  runtime       = "python3.8"

  environment {
    variables = {
      "authour"   = "Stephen Akuffo",
      "S3_BUCKET" = "saa-test-kms",
      "KEY_ARN"   = "arn:aws:kms:us-east-1:599887973192:key/1bec8484-29b7-464c-9bd9-df9a08955855"
    }
  }

  tags = var.udc_default_tags

}

resource "aws_lambda_function" "kms_with_lambda_read" {
  filename      = data.archive_file.lambda_function_read.output_path
  function_name = var.saa_lambda_function_read.name
  role          = var.precreated_lambda_role_read.arn
  handler       = "${var.saa_lambda_function_read.file}.lambda_handler"
  runtime       = "python3.8"

  environment {
    variables = {
      "authour"   = "Stephen Akuffo",
      "S3_BUCKET" = "saa-test-kms",
    }
  }

  tags = var.udc_default_tags

}
