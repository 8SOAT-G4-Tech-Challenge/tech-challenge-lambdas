resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.project_name}-bucket-${terraform.workspace}"

  tags = "${var.s3_tags}"
}