import json
import boto3

def lambda_handler(event, context):
    # to-do implement
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda! Something be changed')
    }
