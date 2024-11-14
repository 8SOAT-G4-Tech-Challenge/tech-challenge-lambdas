variable "api_vars" {
	description = "Gateway variables"
	type        = map(string)
	default     = {}
}

variable "cognito_user_pool_arn" {
  description = "ARN do Cognito User Pool"
  type        = string
}

variable "client_admin_id" {
	description = "ID do client para administradores"
	type        = string
}