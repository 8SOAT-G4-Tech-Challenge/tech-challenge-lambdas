module "s3" {
  source = "./modules/s3"
}

module "cognito" {
	source = "./modules/cognito"

	depends_on = [
		module.s3
	]
}

module "api_gateway" {
	source = "./modules/api_gateway"

	depends_on = [
		module.cognito
	]
}