module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  region       = var.region
  environment  = var.environment
}

module "ssh_key_pair" {
  source = "./modules/sshKeyPair"

  ec2_key_pair_path     = var.ec2_key_pair_path
  ec2_key_pair_filename = var.ec2_key_pair_filename
}

module "webserver" {
  source = "./modules/webserver"

  project_name              = var.project_name
  region                    = var.region
  environment               = var.environment
  vpc_id                    = module.vpc.vpc_id
  subnet_id                 = module.vpc.public_subnet_id
  web_dmz_security_group_id = module.vpc.web_dmz_security_group_id
  ec2_ssh_key_pair_name     = module.ssh_key_pair.key_name
}

module "app_servers" {
  source = "./modules/appServers"

  project_name                   = var.project_name
  region                         = var.region
  environment                    = var.environment
  vpc_id                         = module.vpc.vpc_id
  subnet_id                      = module.vpc.private_subnet_id
  internal_dmz_security_group_id = module.vpc.web_dmz_security_group_id
  ec2_ssh_key_pair_name          = module.ssh_key_pair.key_name
}
