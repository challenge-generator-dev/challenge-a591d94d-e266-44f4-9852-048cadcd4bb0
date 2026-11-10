# Módulo de base de datos para la API de pedidos
# Superficie de práctica: el estudiante implementará los recursos de base de datos

resource "aws_db_subnet_group" "api_db_subnet_group" {
  name       = "${var.app_name}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "${var.app_name}-db-subnet-group"
    Environment = var.environment
  }
}

resource "aws_db_instance" "api_db" {
  identifier     = "${var.app_name}-db"
  engine         = "postgres"
  engine_version = "16.3"
  instance_class = var.db_instance_class

  allocated_storage     = var.db_storage_size
  max_allocated_storage = var.db_max_storage
  storage_type          = "gp3"
  storage_encrypted     = true

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.api_db_subnet_group.name
  vpc_security_group_ids = [var.db_security_group_id]

  backup_retention_period = var.db_backup_retention
  backup_window           = "03:00-04:00"
  maintenance_window      = "mon:04:00-mon:05:00"

  skip_final_snapshot       = var.environment != "prod"
  final_snapshot_identifier = var.environment == "prod" ? "${var.app_name}-final-snapshot" : null

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]

  performance_insights_enabled          = var.environment == "prod"
  performance_insights_retention_period = var.environment == "prod" ? 7 : null

  deletion_protection = var.environment == "prod"

  tags = {
    Name        = "${var.app_name}-db"
    Environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ssm_parameter" "db_endpoint" {
  name  = "/${var.app_name}/${var.environment}/db/endpoint"
  type  = "String"
  value = aws_db_instance.api_db.endpoint

  tags = {
    Name        = "${var.app_name}-db-endpoint"
    Environment = var.environment
  }
}

resource "aws_ssm_parameter" "db_name" {
  name  = "/${var.app_name}/${var.environment}/db/name"
  type  = "String"
  value = var.db_name

  tags = {
    Name        = "${var.app_name}-db-name"
    Environment = var.environment
  }
}

resource "aws_ssm_parameter" "db_username" {
  name  = "/${var.app_name}/${var.environment}/db/username"
  type  = "SecureString"
  value = var.db_username

  tags = {
    Name        = "${var.app_name}-db-username"
    Environment = var.environment
  }
}

output "db_endpoint" {
  value       = aws_db_instance.api_db.endpoint
  description = "Endpoint de la base de datos RDS"
}

output "db_name" {
  value       = var.db_name
  description = "Nombre de la base de datos"
}

output "db_port" {
  value       = aws_db_instance.api_db.port
  description = "Puerto de la base de datos"
}

output "db_arn" {
  value       = aws_db_instance.api_db.arn
  description = "ARN de la instancia RDS"
}