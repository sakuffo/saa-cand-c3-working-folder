from __future__ import print_function
import time
import os
import sys

import aws_encryption_sdk
from aws_encryption_sdk import CommitmentPolicy
import boto3

s3 = boto3.client('s3')
s3_bucket_name = os.environ['S3_BUCKET']
key_arn = os.environ['KMS_CUSTOMER_MASTER_KEY_ARN']


def cycle_string(key_arn_saa, s3_bucket_saa, source_plaintext, botocore_session=None):
    client = aws_encryption_sdk.EncryptionSDKClient(
        commitment_policy=CommitmentPolicy.REQUIRE_ENCRYPT_ALLOW_DECRYPT)

    if botocore_session is not None:
        kms_kwargs["botocore_session"] = botocore_session

    kms_kwargs = dict(key_ids=[key_arn])
    master_key_provider = aws_encryption_sdk.StrictAwsKmsMasterKeyProvider(
        **kms_kwargs)

    print('Encrypting plain text message...')
    ciphertext, encryptor_header = aws_encryption_sdk.EncryptionSDKClient.encrypt(
        source=source_plaintext,
        key_provider=master_key_provider
    )

    print('Storing date in S3 bucket...')
    response = s3.put_object(
        Body=ciphertext,
        Bucket=s3_bucket_name,
        Key='c3_encrypted_file.txt'
    )

    # kms_kwargs = dict(key_ids=[key_arn])
    # if botocore_session is not None:
    #     kms_kwargs['botocore_session'] = botocore_session
    # master_key_provider = aws_encryption_sdk.StrictAwsKmsMasterKeyProvider(**kms_kwargs)

    # ciphertext, encryptor_header = client.encrypt(source=source_plaintext, key_provider=master_key_provider)

    # cycled_plaintext, decrypted_header = client.decrypt(source=ciphertext, key_provider=master_key_provider)

    # assert cycled_plaintext == source_plaintext

    # assert all (
    #     pair in decrypted_header.encryption_context.items() for pair in encryptor_header.encryption_context.items()
    # )


if __name__ == '__main__':
    cycle_string(key_arn, s3_bucket_name, sys.argv[1])
