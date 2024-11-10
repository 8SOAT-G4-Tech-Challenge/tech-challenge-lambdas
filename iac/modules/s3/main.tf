resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.project_name}-bucket-${terraform.workspace}"

  tags = {
    Name    = "Bucket for storing Terraform state - ${terraform.workspace}"
    Iac     = true
    context = "${terraform.workspace}"
  }
}