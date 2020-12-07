# This will zip up the lambda code so it is ready for upload
data "archive_file" "lambda_function" {
  type        = "zip"
  source_file = "./lambda_payload/saa_lambda_function_kms.py"
  output_path = "./lambda_payload/saa_lambda_function_kms.zip"
}

# This will zip up the lambda code so it is ready for upload
data "archive_file" "lambda_function_read" {
  type        = "zip"
  source_file = "./lambda_payload/saa_lambda_function_kms_read.py"
  output_path = "./lambda_payload/saa_lambda_function_kms_read.zip"
}
