import {
  to = aws_cloudwatch_log_group.lambda
  id = "/aws/lambda/Mannually-created"

}

resource "aws_cloudwatch_log_group" "lambda" {
  name = "/aws/lambda/Mannually-created"
}
