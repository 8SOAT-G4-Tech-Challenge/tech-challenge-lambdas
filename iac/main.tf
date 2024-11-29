/* module "s3" {
  source = "./modules/s3"
  s3_tags = {
    Name    = "Bucket for storing Terraform state - ${terraform.workspace}"
    Iac     = true
    context = "${terraform.workspace}"
  }
} */

module "cognito" {
  source = "./modules/cognito"
  cognito_vars = {
    project_name        = var.project_name
    environment         = var.environment
    admin_user_email    = var.admin_user_email
    admin_user_password = var.admin_user_password
  }
}

module "api_gateway" {
  source = "./modules/api_gateway"

  cognito_user_pool_arn = module.cognito.user_pool_arn
  client_admin_id       = module.cognito.admin_client_id

  depends_on = [
    module.cognito
  ]

  api_vars = {
    project_name = var.project_name
    environment  = var.environment
    aws_region   = var.aws_region
		aws_account_id = var.aws_account_id
  }
}