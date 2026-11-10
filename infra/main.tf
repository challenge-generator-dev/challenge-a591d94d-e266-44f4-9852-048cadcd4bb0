// Configuración principal de Terraform para la API de la app de pedidos
// Este archivo orquesta los módulos de infraestructura

terraform {
  required_version = "~> 1.9.5"
}

// Módulo de red: VPC, subnets, internet gateway, tablas de rutas
// El módulo network crea su propia VPC con los CIDRs y AZs especificados
module "network" {
  source = "./modules/network"

  app_name             = var.app_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  api_port             = var.api_port
}

// Módulo de seguridad: grupos de seguridad y roles IAM
// Usa los outputs del módulo network para configurar la seguridad
module "security" {
  source = "./modules/security"

  app_name       = var.app_name
  vpc_id         = module.network.vpc_id
  environment    = var.environment
  public_subnets = module.network.public_subnet_ids
  api_port       = var.api_port
}

// Módulo de base de datos: RDS PostgreSQL
// Los outputs de network proporcionan las subnets y security group necesarios
module "database" {
  source = "./modules/database"

  app_name             = var.app_name
  private_subnet_ids   = module.network.private_subnet_ids
  environment          = var.environment
  db_instance_class    = var.db_instance_class
  db_storage_size      = var.db_storage_size
  db_max_storage       = var.db_max_storage
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
  db_security_group_id = module.network.db_security_group_id
  db_backup_retention  = var.db_backup_retention
}

// Módulo de compute: ASG, ALB, launch template
// Integra outputs de network, security y database
module "compute" {
  source = "./modules/compute"

  app_name              = var.app_name
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  key_pair_name         = var.key_pair_name
  api_security_group_id = module.security.api_security_group_id
  environment           = var.environment
  private_subnet_ids    = module.network.private_subnet_ids
  desired_capacity      = var.desired_capacity
  max_size              = var.max_size
  min_size              = var.min_size
  public_subnet_ids     = module.network.public_subnet_ids
  api_port              = var.api_port
  vpc_id                = module.network.vpc_id
}