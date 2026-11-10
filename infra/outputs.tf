// Salidas de Terraform con información relevante post-despliegue
// para la aplicación móvil y otros consumidores

output "api_endpoint" {
  description = "Endpoint público del Application Load Balancer para acceder a la API"
  value       = module.compute.alb_dns_name
}

output "api_base_url" {
  description = "URL base completa del API con protocolo HTTPS"
  value       = "https://${module.compute.alb_dns_name}"
}

output "database_endpoint" {
  description = "Endpoint de la base de datos RDS"
  value       = module.database.db_endpoint
}

output "database_name" {
  description = "Nombre de la base de datos"
  value       = module.database.db_name
}

output "database_port" {
  description = "Puerto de la base de datos"
  value       = module.database.db_port
}

output "vpc_id" {
  description = "ID de la VPC donde se desplegó la infraestructura"
  value       = var.vpc_id
}

output "public_subnets" {
  description = "IDs de las subnets públicas"
  value       = var.public_subnets
}

output "private_subnets" {
  description = "IDs de las subnets privadas"
  value       = var.private_subnets
}

output "autoscaling_group_name" {
  description = "Nombre del Auto Scaling Group"
  value       = module.compute.autoscaling_group_name
}

output "environment" {
  description = "Entorno de despliegue"
  value       = var.environment
}

output "region" {
  description = "Región de AWS donde se desplegó la infraestructura"
  value       = var.aws_region
}