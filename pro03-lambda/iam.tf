import {
  to = aws_iam_role.lambda_role
  id = "Mannually-created-role-2w7wpja3"
}

import {
  to = aws_iam_policy.lambda_execution
  id = "arn:aws:iam::529088288646:policy/service-role/AWSLambdaBasicExecutionRole-6e644145-f643-4744-ae73-18e070e7931f"
}

data "aws_region" "this" {

}

data "aws_caller_identity" "this" {

}
data "aws_iam_policy_document" "assume_lambda_exec_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }

  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }

}

resource "aws_iam_policy" "lambda_execution" {
  name = "AWSLambdaBasicExecutionRole-6e644145-f643-4744-ae73-18e070e7931f"
  path = "/service-role/"
  policy = jsonencode({
    Statement = [{
      Action   = "logs:CreateLogGroup"
      Effect   = "Allow"
      Resource = "arn:aws:logs:${data.aws_region.this.name}:${data.aws_caller_identity.this.account_id}:*"
      }, {
      Action   = ["logs:CreateLogStream", "logs:PutLogEvents"]
      Effect   = "Allow"
      Resource = ["arn:aws:logs:us-east-1:529088288646:log-group:/aws/lambda/Mannually-created:*"]
    }]
    Version = "2012-10-17"
  })
}


resource "aws_iam_role" "lambda_role" {
  assume_role_policy = data.aws_iam_policy_document.assume_lambda_exec_role.json
  name               = "Mannually-created-role-2w7wpja3"
  path               = "/service-role/"

}

resource "aws_iam_role_policy_attachment" "lambda_attachment" {
  role       = aws_iam_policy.lambda_execution.name
  policy_arn = "arn:aws:iam::529088288646:role/service-role/Mannually-created-role-2w7wpja3"

  #aws_iam_policy.lambda_execution.arn

}



# resource "aws_iam_role" "lambda_role" {
#   assume_role_policy = jsonencode({
#     Statement = [{  
#       Action = "sts:AssumeRole"
#       Effect = "Allow"
#       Principal = {
#         Service = "lambda.amazonaws.com"
#       }
#     }]
#     Version = "2012-10-17"
#   })
#   name                  = "Mannually-created-role-2w7wpja3"
#   path                  = "/service-role/"

# }
