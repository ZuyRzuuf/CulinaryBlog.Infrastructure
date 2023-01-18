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

  environment = var.environment

  project_name = var.project_name
  region       = var.region

  vpc_id                    = module.vpc.vpc_id
  subnet_id                 = module.vpc.public_subnet_id
  web_dmz_security_group_id = module.vpc.web_dmz_security_group_id
  ec2_ssh_key_pair_name     = module.ssh_key_pair.key_name
}

module "app_servers" {
  source = "./modules/appServers"

  environment = var.environment

  project_name = var.project_name
  region       = var.region

  vpc_id                         = module.vpc.vpc_id
  subnet_id                      = module.vpc.private_subnet_id
  internal_dmz_security_group_id = module.vpc.web_dmz_security_group_id
  ec2_ssh_key_pair_name          = module.ssh_key_pair.key_name
}

module "database" {
  source = "./modules/rds"

  project_name = var.project_name
  region       = var.region

  vpc_id = module.vpc.vpc_id

  db_engine                        = var.db_engine
  db_engine_version                = var.db_engine_version
  db_identifier                    = var.db_identifier
  db_instance_class                = var.db_instance_class
  db_storage_size                  = var.db_allocation_storage
  db_storage_type                  = var.db_storage_type
  db_name                          = var.db_name
  db_username                      = var.db_username
  db_password                      = var.db_password
  db_security_group_id             = module.vpc.internal_dmz_security_group_id
  db_main_private_subnet_id        = module.vpc.private_subnet_id
  db_secondary_private_subnet_cidr = var.db_secondary_private_subnet_cidr
}
