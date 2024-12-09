terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Após subir o bucket, descomente o bloco abaixo
  /* backend "s3" {
    bucket  = "tech-challenge-bucket-state-tf"
    region  = "us-east-1"
    key     = "terraform.tfstate"
    encrypt = true
  } */
}

provider "aws" {
  region = "us-east-1"
}

/* resource "aws_s3_bucket" "terraform_state" {
  bucket = var.state_bucket

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.bucket

  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [
    aws_s3_bucket.terraform_state
  ]
} */
