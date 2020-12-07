terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_iam_policy" "saa_policy" {
  name        = "cand-c3-l4-e1-iam-policy"
  path        = "/"
  description = "a policy to test IAC scanning"
  policy      = file("./iam-policies/saa_policy.json")
}