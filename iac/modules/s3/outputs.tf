output "bucket_domain_name" {
  value       = aws_s3_bucket.s3_bucket.bucket_domain_name
  sensitive   = false
  description = "Domain name of the bucket"
}

output "bucket_region" {
  value       = aws_s3_bucket.s3_bucket.region
  sensitive   = false
  description = "Bucket region"
}

output "bucket_id" {
	value       = aws_s3_bucket.s3_bucket.id
	sensitive   = false
	description = "Bucket ID"
}