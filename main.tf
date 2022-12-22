module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  region       = var.region
}

module "webserver" {
  source = "./modules/webserver"

  project_name = var.project_name
  region       = var.region
  environment  = var.environment
  vpc_id       = module.vpc.vpc_id
  subnet_id    = module.vpc.public_subnet_id
  ec2_key_pair = var.ec2_key_pair
}
