// Variables para el módulo de base de datos (RDS PostgreSQL)

variable "app_name" {
  description = "Nombre de la aplicación"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs de las subnets privadas para la base de datos"
  type        = list(string)
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}

variable "db_instance_class" {
  description = "Clase de instancia de base de datos"
  type        = string
  default     = "db.t3.micro"
}

variable "db_storage_size" {
  description = "Tamaño de almacenamiento en GB"
  type        = number
  default     = 20
}

variable "db_max_storage" {
  description = "Tamaño máximo de almacenamiento en GB"
  type        = number
  default     = 100
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
}

variable "db_username" {
  description = "Usuario maestro de la base de datos"
  type        = string
}

variable "db_password" {
  description = "Contraseña del usuario maestro"
  type        = string
  sensitive   = true
}

variable "db_security_group_id" {
  description = "ID del grupo de seguridad para la base de datos"
  type        = string
}

variable "db_backup_retention" {
  description = "Días de retención de backups"
  type        = number
  default     = 7
}