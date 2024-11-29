# Examplo da criação de recursos de lambda via terraform

# Documentação Terraform - AWS Lambda Function
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function


/* resource "aws_lambda_function" "auth_function" {
  filename         = "../../../lambdas/auth-function/dist/function.zip"
  function_name    = "${var.project_name}-${var.environment}-auth"
  role            = aws_iam_role.lambda_role.arn
  handler         = "index.handler"
  runtime         = "nodejs18.x"
}

resource "aws_lambda_function" "validate_cpf" {
  filename      = "../../../lambdas/validate-cpf/dist/function.zip"
  function_name = "${var.project_name}-${var.environment}-validate-cpf"
  handler      = "index.handler"
  runtime      = "nodejs18.x"
  role         = aws_iam_role.lambda_role.arn
}

... */
