# AWS Region to be used
variable "aws-primary" {
  default = "us-east-1"
}
# Lambda function info
variable "saa_lambda_function" {
  type = object({
    name = string
    file = string
  })
  default = {
    name = "saa_lambda_function_kms"
    file = "saa_lambda_kms"
  }
}

variable "saa_lambda_function_read" {
  type = object({
    name = string
    file = string
  })
  default = {
    name = "saa_lambda_function_kms_read"
    file = "saa_lambda_kms_read"
  }
}


variable "precreated_lambda_role" {
  type = object({
    name = string
    arn  = string
  })
  default = {
    name = "cand-c3-l3-ex2-write"
    arn  = "arn:aws:iam::599887973192:role/cand-c3-l3-ex2-write"
  }
}

variable "precreated_lambda_role_read" {
  type = object({
    name = string
    arn  = string
  })
  default = {
    name = "cand-c3-l3-ex2-read"
    arn  = "arn:aws:iam::599887973192:role/cand-c3-l3-ex2-read"
  }
}

variable "udc_default_tags" {
  type = map(any)
  default = {
    "courseWork" : "true",
    "entity" : "udacity",
    "program" : "aws-architect"
  }
  description = "Tags to mark all resources for the course"
}
