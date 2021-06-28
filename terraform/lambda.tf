data "archive_file" "fetcher-lambda" {
    type = "zip"
    output_path = "fetcher-lambda.zip"
    source {
        content = file("../src/ex_lambda_zip.py")
        filename = "src/ex_lambda_zip.py"
    }

    source {
        content = file("../src/my-lambda.py")
        filename = "src/my-lambda.py"
    }
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

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

resource "aws_lambda_function" "lambda-fetcher" {
  filename      = data.archive_file.fetcher-lambda.output_path
  # source_code_hash = data.archive_file.fetcher-lambda.output_base64sha256
  function_name = "poc_lambda"
  source_code_hash = filebase64sha256("fetcher-lambda.zip")
#   s3_bucket = "lambda-s3"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "src.ex_lambda_zip.lambda_handler"
  runtime       = "python3.8"
  timeout       = 600
  memory_size   = 256

  environment {
    variables = {
      foo = "bar"
    }
  }
}

