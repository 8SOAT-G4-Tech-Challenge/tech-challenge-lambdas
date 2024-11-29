variable "project_name" {
  type        = string
  description = "Project name"
}

variable "environment" {
  type        = string
  description = "Environment (dev, staging, prod)"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "admin_user_email" {
  type        = string
  description = "Email do usuário administrador"
}

variable "admin_user_password" {
  type        = string
  description = "Senha do usuário administrador"
}

variable "aws_account_id" {
  type        = string
  description = "ID da conta AWS Lab Academy"
}