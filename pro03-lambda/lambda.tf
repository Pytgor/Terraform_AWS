import {
  to = aws_lambda_function.this
  id = "Mannually-created"
}

# Archive a single file.

data "archive_file" "lambda_code" {
  type        = "zip"
  source_file = "${path.root}/build/index.mjs"
  output_path = "${path.root}/lambda.zip"
}


resource "aws_lambda_function" "this" {
  description   = "A starter AWS Lambda function."
  filename      = "lambda.zip"
  function_name = "Mannually-created"
  handler       = "index.handler"
  role          = aws_iam_role.lambda_role.arn
  # role             = "arn:aws:iam::529088288646:role/service-role/Mannually-created-role-2w7wpja3"
  runtime          = "nodejs18.x"
  source_code_hash = data.archive_file.lambda_code.output_base64sha256

  tags = {
    "lambda-console:blueprint" = "hello-world"
  }

  timeout = 3
  environment {
    variables = {}
  }
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format = "Text"
    log_group  = "/aws/lambda/Mannually-created"

  }

}


resource "aws_lambda_function_url" "this" {
  function_name      = aws_lambda_function.this.function_name
  qualifier          = "my_alias"
  authorization_type = "NONE"

}