output "lambda_function_arn" {
  value = aws_lambda_function.kms_with_lambda.arn
}

output "lambda_function_arn_read" {
  value = aws_lambda_function.kms_with_lambda_read.arn
}


