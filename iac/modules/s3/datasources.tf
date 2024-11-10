data "aws_s3_bucket" "bucket" {
  bucket = "${var.project_name}-bucket-${terraform.workspace}"
}