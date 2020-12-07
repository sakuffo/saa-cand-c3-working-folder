import os
import sys
import boto3

# ini
s3 = boto3.client('s3')

file_to_upload = sys.argv[1]
name_of_file = sys.argv[2]
s3_bucket_name = os.environ['S3_BUCKET']
key_arn = os.environ['KMS_CUSTOMER_MASTER_KEY_ARN']


def encrypted_upload(u_file, bucket_name, filename, key_arn):
    response = s3.put_object(
        Bucket=bucket_name,
        ServerSideEncryption='AES256',
        Body=u_file,
        SSECustomerKey=key_arn,
        Key=filename
    )

if __name__ == "__main__":
    encrypted_upload(file_to_upload, s3_bucket_name, name_of_file, key_arn)
