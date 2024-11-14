variable "project_name" {
	description = "The name of the S3 bucket"
	type        = string
	default			= "tech-challenge-gateway"
}

variable "s3_tags" {
	description = "The tags to apply to the S3 bucket"
	type        = map(string)
	default     = {}
}